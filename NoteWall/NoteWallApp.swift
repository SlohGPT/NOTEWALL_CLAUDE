import SwiftUI
import RevenueCat

@main
struct NoteWallApp: App {
    @AppStorage("hasCompletedSetup") private var hasCompletedSetup = false
    @State private var showOnboarding = false
    
    private let onboardingVersion = 3

    init() {
        // Initialize crash reporting
        setupCrashReporting()
        HomeScreenImageManager.prepareStorageStructure()
        configureRevenueCat()
        
        // Check onboarding status on init (only show for first launch)
        let shouldShow = !hasCompletedSetup
        _showOnboarding = State(initialValue: shouldShow)
        
        // Reset paywall data if this is a fresh install
        if !hasCompletedSetup {
            PaywallManager.shared.resetForFreshInstall()
        }
    }

    private func configureRevenueCat() {
        let configuration = Configuration
            .builder(withAPIKey: "test_VXwqNhGerYQUCqvvM2NEltrrEhM")
            .with(entitlementVerificationMode: .informational)
            .build()

        Purchases.configure(with: configuration)
        // Production: Use default log level (errors only)
        PaywallManager.shared.connectRevenueCat()
    }
    
    private func setupCrashReporting() {
        // Enable crash reporting in production
        CrashReporter.isEnabled = true
        
        // Set app version for crash reports
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
           let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            CrashReporter.setCustomKey("app_version", value: "\(version) (\(build))")
        }
        
        // Set device info
        CrashReporter.setCustomKey("device_model", value: UIDevice.current.model)
        CrashReporter.setCustomKey("ios_version", value: UIDevice.current.systemVersion)
        
        CrashReporter.logMessage("App launched", level: .info)
        
        // To enable Firebase Crashlytics, uncomment below and add Firebase SDK:
        /*
        import FirebaseCore
        import FirebaseCrashlytics
        
        FirebaseApp.configure()
        
        // Enable Crashlytics collection
        Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)
        */
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
                .fullScreenCover(isPresented: $showOnboarding) {
                    OnboardingView(
                        isPresented: $showOnboarding,
                        onboardingVersion: onboardingVersion
                    )
                }
                .onAppear {
                    // Show onboarding only for users who haven't completed setup yet
                    showOnboarding = !hasCompletedSetup
                }
                .onChange(of: hasCompletedSetup) { newValue in
                    showOnboarding = !newValue
                }
                .onOpenURL { url in
                    // Handle URL scheme when app is opened via notewall://
                    // This allows the shortcut to redirect back to the app
                    print("🔗 NoteWallApp: Opened via URL: \(url)")
                    print("🔗 Scheme: \(url.scheme ?? "nil"), Host: \(url.host ?? "nil"), Path: \(url.path)")
                    
                    if url.scheme?.lowercased() == "notewall" {
                        let lowerHost = url.host?.lowercased()
                        let lowerPath = url.path.lowercased()
                        if lowerHost == "wallpaper-updated" || lowerPath.contains("wallpaper-updated") {
                            print("✅ NoteWallApp: Posting .shortcutWallpaperApplied notification")
                            NotificationCenter.default.post(name: .shortcutWallpaperApplied, object: nil)
                        } else {
                            print("⚠️ NoteWallApp: URL doesn't match wallpaper-updated pattern")
                        }
                    }
                }
                .onReceive(NotificationCenter.default.publisher(for: .onboardingReplayRequested)) { _ in
                    showOnboarding = true
                }
        }
    }
}
