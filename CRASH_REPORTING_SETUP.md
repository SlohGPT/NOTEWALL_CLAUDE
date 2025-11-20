# Crash Reporting Setup Guide

## Option 1: Firebase Crashlytics (Recommended)

### Step 1: Create Firebase Project
1. Go to https://console.firebase.google.com/
2. Click "Add project"
3. Enter project name: "NoteWall"
4. Disable Google Analytics (optional) or enable it
5. Click "Create project"

### Step 2: Add iOS App to Firebase
1. Click "Add app" → iOS
2. Enter iOS bundle ID: `com.notewall.app`
3. Enter App nickname: "NoteWall"
4. Click "Register app"

### Step 3: Download GoogleService-Info.plist
1. Download the `GoogleService-Info.plist` file
2. Drag it into your Xcode project (make sure "Copy items if needed" is checked)
3. Add it to the NoteWall target

### Step 4: Add Firebase SDK via Swift Package Manager
1. In Xcode: File → Add Packages...
2. Enter: `https://github.com/firebase/firebase-ios-sdk`
3. Select "Up to Next Major Version" and version `10.0.0` or later
4. Add these products:
   - FirebaseCrashlytics
   - FirebaseAnalytics (optional, for analytics)

### Step 5: Update NoteWallApp.swift
The code has been updated to initialize Firebase. You just need to:
1. Add the `GoogleService-Info.plist` file to your project
2. Build and run - Firebase will automatically collect crashes

### Step 6: Test Crash Reporting
Add this test code temporarily to verify it works:
```swift
// Test crash (remove after testing!)
Button("Test Crash") {
    fatalError("Test crash for Crashlytics")
}
```

### Step 7: View Crashes
1. Go to Firebase Console → Crashlytics
2. Crashes will appear within a few minutes after they occur

---

## Option 2: Apple's Built-in Crash Reporting (Already Active)

Apple automatically collects crash reports through:
- **Xcode Organizer** (Window → Organizer → Crashes)
- **App Store Connect** (Analytics → Crashes)

This is already working - no setup needed! However, it's less detailed than Firebase.

---

## Option 3: Sentry (Alternative)

If you prefer Sentry:
1. Sign up at https://sentry.io/
2. Create a new iOS project
3. Add Sentry SDK via Swift Package Manager: `https://github.com/getsentry/sentry-cocoa`
4. Initialize in `NoteWallApp.swift`:
```swift
import Sentry

SentrySDK.start { options in
    options.dsn = "YOUR_SENTRY_DSN"
    options.debug = false
}
```

---

## Current Implementation

I've created a `CrashReporter.swift` file that provides a simple interface for crash reporting. It currently uses Apple's built-in reporting but can be easily extended to use Firebase or Sentry.

To use it:
```swift
CrashReporter.logError("Something went wrong", error: error)
CrashReporter.setUserProperty("premium", value: "true")
```


