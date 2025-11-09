import SwiftUI
import PhotosUI
import UIKit
import Combine

struct SettingsView: View {
    @AppStorage("savedNotes") private var savedNotesData: Data = Data()
    @AppStorage("skipDeletingOldWallpaper") private var skipDeletingOldWallpaper = false
    @AppStorage("lockScreenBackground") private var lockScreenBackgroundRaw = LockScreenBackgroundOption.default.rawValue
    @AppStorage("lockScreenBackgroundMode") private var lockScreenBackgroundModeRaw = LockScreenBackgroundMode.default.rawValue
    @AppStorage("lockScreenBackgroundPhotoData") private var lockScreenBackgroundPhotoData: Data = Data()
    @AppStorage("hasCompletedSetup") private var hasCompletedSetup = false
    @AppStorage("completedOnboardingVersion") private var completedOnboardingVersion = 0
    @AppStorage("homeScreenUsesCustomPhoto") private var homeScreenUsesCustomPhoto = false
    @State private var showDeleteAlert = false
    @State private var showResetAlert = false
    var selectedTab: Binding<Int>?

    private let shortcutURL = "https://www.icloud.com/shortcuts/a00482ed7b054ee0b42d7d9a7796c7eb"
    init(selectedTab: Binding<Int>? = nil) {
        self.selectedTab = selectedTab
    }

    @AppStorage("homeScreenPresetSelection") private var homeScreenPresetSelectionRaw = "black"
    @State private var isSavingHomeScreenPhoto = false
    @State private var homeScreenStatusMessage: String?
    @State private var homeScreenStatusColor: Color = .gray
    @State private var isSavingLockScreenBackground = false
    @State private var lockScreenBackgroundStatusMessage: String?
    @State private var lockScreenBackgroundStatusColor: Color = .gray

    var body: some View {
        NavigationView {
            settingsList
                .listStyle(.insetGrouped)
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .alert("Delete All Notes?", isPresented: $showDeleteAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Delete", role: .destructive) {
                        deleteAllNotes()
                    }
                } message: {
                    Text("This action cannot be undone. All your notes will be permanently deleted.")
                }
                .alert("Reset to Fresh Install?", isPresented: $showResetAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Reset Everything", role: .destructive) {
                        resetToFreshInstall()
                    }
                } message: {
                    Text("This will delete ALL app data including notes, wallpapers, settings, and onboarding progress. The app will restart as if you just installed it for the first time.")
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    @ViewBuilder
    private var settingsList: some View {
        List {
            homeScreenSection
            actionsSection
            wallpaperSettingsSection
            supportSection
        }
    }

    private var wallpaperSettingsSection: some View {
        Section(header: Text("Wallpaper Settings")) {
            Toggle(isOn: $skipDeletingOldWallpaper) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Skip Deleting Old Wallpapers")
                    Text("When enabled, old wallpapers won't be deleted automatically. This avoids system permission popups.")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }

    @ViewBuilder
    private var homeScreenSection: some View {
        if #available(iOS 16.0, *) {
            Section("Home Screen Photo") {
                HomeScreenPhotoPickerView(
                    isSavingHomeScreenPhoto: $isSavingHomeScreenPhoto,
                    homeScreenStatusMessage: $homeScreenStatusMessage,
                    homeScreenStatusColor: $homeScreenStatusColor,
                    homeScreenImageAvailable: Binding(
                        get: { homeScreenUsesCustomPhoto },
                        set: { homeScreenUsesCustomPhoto = $0 }
                    ),
                    handlePickedHomeScreenData: handlePickedHomeScreenData
                )
                .listRowSeparator(.hidden)

                HomeScreenQuickPresetsView(
                    isSavingHomeScreenPhoto: $isSavingHomeScreenPhoto,
                    homeScreenStatusMessage: $homeScreenStatusMessage,
                    homeScreenStatusColor: $homeScreenStatusColor,
                    homeScreenImageAvailable: Binding(
                        get: { homeScreenUsesCustomPhoto },
                        set: { homeScreenUsesCustomPhoto = $0 }
                    ),
                    handlePickedHomeScreenData: handlePickedHomeScreenData
                )

                LockScreenBackgroundPickerView(
                    isSavingBackground: $isSavingLockScreenBackground,
                    statusMessage: $lockScreenBackgroundStatusMessage,
                    statusColor: $lockScreenBackgroundStatusColor,
                    backgroundMode: Binding(
                        get: { LockScreenBackgroundMode(rawValue: lockScreenBackgroundModeRaw) ?? .default },
                        set: { lockScreenBackgroundModeRaw = $0.rawValue }
                    ),
                    backgroundOption: Binding(
                        get: { LockScreenBackgroundOption(rawValue: lockScreenBackgroundRaw) ?? .default },
                        set: { lockScreenBackgroundRaw = $0.rawValue }
                    ),
                    backgroundPhotoData: Binding(
                        get: { lockScreenBackgroundPhotoData },
                        set: { lockScreenBackgroundPhotoData = $0 }
                    ),
                    backgroundPhotoAvailable: !lockScreenBackgroundPhotoData.isEmpty
                )
                .padding(.top, 4)

                UpdateWallpaperButton()
                    .listRowSeparator(.hidden)
                    .padding(.top, 8)
            }
            .onAppear(perform: ensureCustomHomePhotoFlagIsAccurate)
        } else {
            Section(header: Text("Home Screen Photo")) {
                Text("Save a home screen image requires iOS 16 or newer.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.vertical, 4)
            }
            .onAppear(perform: ensureCustomHomePhotoFlagIsAccurate)
        }
    }

    private var actionsSection: some View {
        Section(header: Text("Actions")) {
            Button(action: {
                showResetAlert = true
            }) {
                HStack {
                    Text("Reset to Fresh Install")
                        .foregroundColor(.orange)
                    Spacer()
                    Image(systemName: "arrow.counterclockwise.circle")
                        .foregroundColor(.orange)
                }
            }
            
            Button(action: resetOnboarding) {
                HStack {
                    Text("Replay Welcome Flow")
                    Spacer()
                    Image(systemName: "sparkles")
                        .foregroundColor(.appAccent)
                }
            }

            Button(action: {
                showDeleteAlert = true
            }) {
                HStack {
                    Text("Delete All Notes")
                        .foregroundColor(.red)
                    Spacer()
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }

            Button(action: reinstallShortcut) {
                HStack {
                    Text("Reinstall Shortcut")
                    Spacer()
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.appAccent)
                }
            }
        }
    }

    private var supportSection: some View {
        Section(header: Text("Support")) {
            HStack {
                Text("Contact")
                Spacer()
                Text("NoteWall Support")
                    .foregroundColor(.gray)
            }
        }
    }

    private func deleteAllNotes() {
        savedNotesData = Data()
        // Switch back to Home tab after deleting notes
        if let selectedTab = selectedTab {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                selectedTab.wrappedValue = 0
            }
        }
    }

    private func reinstallShortcut() {
        guard let url = URL(string: shortcutURL) else { return }
        UIApplication.shared.open(url)
    }

    private func resetOnboarding() {
        hasCompletedSetup = false
        completedOnboardingVersion = 0
        NotificationCenter.default.post(name: .onboardingReplayRequested, object: nil)
    }
    
    private func resetToFreshInstall() {
        print("🔄 RESETTING APP TO FRESH INSTALL STATE")
        
        // 1. Clear all AppStorage values
        savedNotesData = Data()
        skipDeletingOldWallpaper = false
        lockScreenBackgroundRaw = LockScreenBackgroundOption.default.rawValue
        lockScreenBackgroundModeRaw = LockScreenBackgroundMode.default.rawValue
        lockScreenBackgroundPhotoData = Data()
        hasCompletedSetup = false
        completedOnboardingVersion = 0
        homeScreenUsesCustomPhoto = false
        homeScreenPresetSelectionRaw = ""
        
        // Clear other AppStorage keys that might exist
        UserDefaults.standard.removeObject(forKey: "lastLockScreenIdentifier")
        UserDefaults.standard.removeObject(forKey: "hasCompletedInitialWallpaperSetup")
        
        print("✅ Cleared all AppStorage data")
        
        // 2. Delete all files from Documents/NoteWall directory
        if let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let noteWallURL = documentsURL.appendingPathComponent("NoteWall", isDirectory: true)
            
            if FileManager.default.fileExists(atPath: noteWallURL.path) {
                do {
                    try FileManager.default.removeItem(at: noteWallURL)
                    print("✅ Deleted all wallpaper files")
                } catch {
                    print("❌ Error deleting files: \(error)")
                }
            }
        }
        
        print("🎉 Reset complete! App is now in fresh install state.")
        print("   Triggering onboarding...")
        
        // 3. Trigger onboarding
        NotificationCenter.default.post(name: .onboardingReplayRequested, object: nil)
        
        // 4. Switch to Home tab
        if let selectedTab = selectedTab {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                selectedTab.wrappedValue = 0
            }
        }
    }

    @available(iOS 16.0, *)
    fileprivate func handlePickedHomeScreenData(_ data: Data) {
        isSavingHomeScreenPhoto = true
        homeScreenStatusMessage = "Saving photo…"
        homeScreenStatusColor = .gray

        Task {
            do {
                guard let image = UIImage(data: data) else {
                    throw HomeScreenImageManagerError.unableToEncodeImage
                }
                try HomeScreenImageManager.saveHomeScreenImage(image)

                await MainActor.run {
                    homeScreenUsesCustomPhoto = true
                    homeScreenStatusMessage = nil
                    homeScreenStatusColor = .gray
                    homeScreenPresetSelectionRaw = ""
                }
            } catch {
                await MainActor.run {
                    homeScreenStatusMessage = error.localizedDescription
                    homeScreenStatusColor = .red
                }
            }

            await MainActor.run {
                isSavingHomeScreenPhoto = false
                isSavingLockScreenBackground = false
            }
        }
    }
}

private struct UpdateWallpaperButton: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var isGenerating = false

    var body: some View {
        Button(action: triggerUpdate) {
            HStack(spacing: 12) {
                if isGenerating {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .font(.system(size: 18, weight: .semibold))
                }

                Text(isGenerating ? "Updating…" : "Update Wallpaper Now")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.appAccent)
            .foregroundColor(.white)
            .cornerRadius(14)
            .animation(.easeInOut(duration: 0.2), value: isGenerating)
        }
        .buttonStyle(.plain)
        .disabled(isGenerating)
        .onReceive(NotificationCenter.default.publisher(for: .requestWallpaperUpdate)) { _ in
            isGenerating = true
        }
        .onReceive(NotificationCenter.default.publisher(for: .wallpaperGenerationFinished)) { _ in
            isGenerating = false
        }
        .onReceive(NotificationCenter.default.publisher(for: .shortcutWallpaperApplied)) { _ in
            isGenerating = false
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                isGenerating = false
            }
        }
    }

    private func triggerUpdate() {
        guard !isGenerating else { return }
        isGenerating = true
        // Show deletion prompt to allow users to clean up old wallpapers
        NotificationCenter.default.post(name: .requestWallpaperUpdate, object: nil)
    }
}

#Preview {
    SettingsView()
}

private extension SettingsView {
    func ensureCustomHomePhotoFlagIsAccurate() {
        let shouldBeEnabled = homeScreenPresetSelectionRaw.isEmpty && HomeScreenImageManager.homeScreenImageExists()
        if homeScreenUsesCustomPhoto != shouldBeEnabled {
            homeScreenUsesCustomPhoto = shouldBeEnabled
        }
    }
}
