# Running NoteWall in Xcode

These steps help you open, sign, and run the project on a device or simulator. PiP onboarding works best on a physical device with Picture in Picture support.

## Prerequisites
- Xcode 15 or newer (built for iOS 17).
- An Apple ID added in **Xcode ▸ Settings… ▸ Accounts** for code signing.
- A physical device for end-to-end PiP testing (simulator cannot enter PiP).

## Open the project
1. Clone or download this repository to your Mac.
2. Double-click `NoteWall.xcodeproj` to open it in Xcode.
3. In the toolbar, pick the **NoteWall** scheme and your target device or a simulator.

## Configure code signing
1. Select the **NoteWall** target in the project navigator.
2. In **Signing & Capabilities**:
   - Choose your personal team.
   - If you cannot use the existing bundle identifier `com.app.notewall`, change it to something unique (e.g., `com.yourname.notewall`).
   - Xcode will create a provisioning profile automatically once the identifier is unique.

## Build and run
1. Press **⌘R** to build and launch.
2. On first launch, the onboarding flow plays `pip-guide-video.mp4` bundled in the app. Keep this file in the repository root so Xcode can copy it into the app bundle during the build.
3. To verify Picture in Picture:
   - Run on a real device.
   - Start onboarding and proceed until the shortcut install step triggers video playback.
   - Send the app to background; PiP should continue playing. If it does not, wait a moment and reopen—playback restarts automatically.

## Troubleshooting
- If signing errors appear, recheck that the bundle identifier is unique and your team is selected.
- If PiP is unavailable, confirm the device supports PiP and that playback started before leaving the app.
- If the build cannot find assets, ensure you opened the `.xcodeproj` from this repository root so resource paths stay correct.
