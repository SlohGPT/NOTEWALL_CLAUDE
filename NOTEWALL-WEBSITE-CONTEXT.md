# NoteWall - Complete Application Context

## Overview

**NoteWall** is an iOS productivity app that transforms your lock screen into a powerful reminder system. The app displays your notes, goals, and to-do items directly on your iPhone's lock screen wallpaper, ensuring you see what matters every time you pick up your phone (up to 498 times per day).

### Core Concept
"You forget things for one simple reason: you don't see them. NoteWall fixes that."

The app generates custom wallpapers with your notes overlaid on them, which are then applied to your lock screen via an iOS Shortcut. This creates a visual cue system that helps users stay focused and accountable to their goals.

---

## Brand Identity

### Brand Colors

**Primary Accent Color (AppAccent):**
- RGB: `rgb(0, 196, 184)` or `#00C4B8`
- Hex: `#00C4B8`
- This is a vibrant cyan/turquoise color used throughout the app for:
  - Primary buttons and CTAs
  - Selection indicators
  - Progress indicators
  - Icons and highlights
  - Links and interactive elements

**Background Colors:**
- Dark mode is the default (`.preferredColorScheme(.dark)`)
- Base dark gradient backgrounds with subtle accent glows
- Lock screen preset options:
  - **Black**: `rgb(2, 2, 2)` - `#020202`
  - **Gray**: `rgb(40, 40, 40)` - `#282828`

**Text Colors:**
- White text on dark backgrounds (default)
- Adaptive text color based on background brightness (white or black)
- Completed notes use dimmed text with strikethrough in accent color

### Logo
- App icon: "OnboardingLogo" asset
- Used in onboarding and paywall screens
- Rounded rectangle with shadow

---

## Technology Stack

### Core Technologies
- **SwiftUI** - Modern declarative UI framework
- **UIKit** - For lower-level UI components and image rendering
- **RevenueCat** - Subscription and in-app purchase management
- **StoreKit 2** - Native iOS in-app purchases
- **PhotosUI** - Photo picker for custom wallpapers (iOS 16+)
- **AVKit/AVFoundation** - Video playback for onboarding tutorials
- **Combine** - Reactive programming for state management

### Key Frameworks
- **Photos Framework** - Saving wallpapers to Photos library
- **Shortcuts App Integration** - Deep linking to run shortcuts
- **UserDefaults/AppStorage** - Local data persistence
- **FileManager** - Wallpaper file storage

### iOS Requirements
- **Minimum iOS Version**: iOS 15.0 (for main app)
- **iOS 16.0+** required for:
  - Direct photo picker integration
  - Enhanced wallpaper customization features

---

## Core Features

### 1. Note Management
- **Add Notes**: Simple text input with instant saving
- **Edit Notes**: Tap to edit, auto-scrolling text field
- **Complete Notes**: Swipe left to mark as done (strikethrough with accent color)
- **Delete Notes**: Swipe right to delete, or use edit mode for bulk deletion
- **Reorder Notes**: Drag and drop to reorder
- **Edit Mode**: Multi-select for bulk operations
- **Note Capacity**: Adaptive - shows as many notes as fit on wallpaper (typically 3-8 depending on length)

### 2. Wallpaper Generation
- **Automatic Layout**: Notes are automatically positioned below lock screen widgets/clock
- **Adaptive Font Sizing**: Font size scales from 52pt (min) to 140pt (max) based on:
  - Number of notes
  - Note length
  - Available screen space
- **Smart Text Color**: Automatically chooses white or black text based on background brightness
- **Background Options**:
  - **Home Screen**: Custom photo or preset (black/gray)
  - **Lock Screen**: Custom photo, preset black, or preset gray
- **Widget-Aware Positioning**: Adjusts note position based on whether user has lock screen widgets
  - With widgets: Notes start at 1030px from top
  - Without widgets: Notes start at 850px from top (closer to clock)
- **Completed Notes**: Displayed with strikethrough and dimmed opacity
- **Shadow Effects**: Text shadows on photo backgrounds for better readability

### 3. Wallpaper Application
- **iOS Shortcut Integration**: Uses "Set NoteWall Wallpaper" shortcut
- **Automatic Shortcut Launch**: Opens shortcut automatically after wallpaper generation
- **File System Storage**: Wallpapers saved to Documents/NoteWall directory
- **Photos Library Option**: Optional saving to Photos (can be disabled)
- **Previous Wallpaper Cleanup**: Option to delete old wallpapers to save space

### 4. Customization Options
- **Home Screen Wallpaper**:
  - Custom photo picker (iOS 16+)
  - Quick presets: Black or Gray
- **Lock Screen Background**:
  - Custom photo
  - Preset: Black
  - Preset: Gray
- **Widget Detection**: Toggle for "I use lock screen widgets" (affects note positioning)
- **Auto-Update**: Wallpaper updates automatically when notes are completed/deleted

### 5. Onboarding Flow
A comprehensive 6-step onboarding process:

1. **Welcome Screen**
   - App logo and value proposition
   - Key benefits highlighted:
     - "Turn Every Pickup Into Focus"
     - "Keep Your Goals Always in Sight"
     - "Beat Scrolling Before It Starts"

2. **Install Shortcut**
   - Instructions to install the iOS Shortcut
   - Picture-in-Picture video guide
   - Shortcut URL: `https://www.icloud.com/shortcuts/37aa5bd3a1274af1b502c8eeda60fbf7`
   - Emphasizes selecting CURRENT wallpaper when setting up shortcut

3. **Add Notes**
   - Interactive note creation
   - Users add their first notes during onboarding
   - Notes are saved and used for initial wallpaper

4. **Choose Wallpapers**
   - Select home screen wallpaper (photo or preset)
   - Select lock screen background (photo or preset)
   - Widget selection (Yes/No for lock screen widgets)
   - "Edit Notes" button to go back and modify notes

5. **Allow Permissions**
   - Video tutorial showing permission requests
   - Instructions to allow ALL permissions
   - Critical for Photos library access

6. **Overview/Ready**
   - Completion confirmation
   - Animated checkmark
   - Tips for automation and shortcuts

### 6. Settings & Management
- **Premium Status Display**: Shows subscription status or remaining free exports
- **Wallpaper Settings**: All customization options
- **Actions**:
  - Reinstall Shortcut (resets app to fresh install)
  - Troubleshooting guide
  - Delete All Notes
- **Support & Legal**:
  - Contact Support (iosnotewall@gmail.com)
  - Terms of Service
  - Privacy Policy
  - End-User License Agreement
  - Share App

### 7. Troubleshooting
- Built-in troubleshooting view
- Step-by-step guide for wallpaper issues
- Option to restart onboarding
- Banner appears on home screen if wallpaper isn't showing

---

## Pricing & Monetization

### Free Tier
- **3 free wallpaper exports** (hard limit)
- After 3 exports, paywall is shown (non-dismissible)
- Free exports are tracked per user

### Premium Subscription (NoteWall+)

**Monthly Plan:**
- Price: **€6.99/month**
- 7-day free trial (if available)
- Auto-renewable subscription

**Yearly Plan:**
- Price: **€14.99/year**
- Equivalent to **€1.25/month** (82% savings vs monthly)
- 7-day free trial (if available)
- Auto-renewable subscription
- **Recommended/Highlighted** in paywall

**Lifetime Plan:**
- Price: **€24.99** (one-time payment)
- Own NoteWall+ forever
- No renewals
- Available in separate sheet/modal
- Special premium UI with animated effects

### Paywall Features
- **Two-Step Flow**:
  1. Plan selection with benefits carousel
  2. Trial explanation (for yearly plan with trial)
- **Benefits Highlighted**:
  - Lock Screen Focus
  - Stay Accountable (see notes 498x per day)
  - Instant Exports (unlimited)
- **Animated UI**: Smooth animations, gradient backgrounds, accent color glows
- **Promo Code Support**: Built-in promo code system (example: "FRIEND2024")

### Paywall Triggers
- **Limit Reached**: After 3 free exports (non-dismissible)
- **Manual**: From Settings
- **First Wallpaper**: Optional trigger after first wallpaper created
- **Settings**: Direct access from Settings tab

### RevenueCat Integration
- **Entitlement ID**: "Notewall+"
- **Lifetime Product ID**: "lifetime"
- **Package Types**: Monthly, Annual, Lifetime
- **Restore Purchases**: Available in paywall

---

## User Experience & Design

### Design Philosophy
- **Dark Mode First**: App defaults to dark mode
- **Minimal & Clean**: Focus on content, not chrome
- **Haptic Feedback**: Extensive use of haptic feedback for:
  - Button taps (light impact)
  - Note actions (light/medium impact)
  - Success/error states (notification haptics)
- **Smooth Animations**: Spring animations, transitions, and micro-interactions
- **Accessibility**: VoiceOver support, proper labels

### Key UI Components
- **Primary Buttons**: Accent color with gradient, shadows, and hover effects
- **Cards**: Rounded corners (12-24pt radius), subtle shadows
- **Lists**: Plain list style, custom row designs
- **Progress Indicators**: Accent color circles with numbers
- **Loading States**: Progress views with accent color tint
- **Empty States**: Helpful messaging with visual cues

### Navigation
- **Tab-Based**: Two tabs (Home, Settings)
- **Bottom Navigation Bar**: Custom design with accent color highlights
- **Modal Presentations**: Sheets for paywall, settings, troubleshooting
- **Full-Screen**: Onboarding uses full-screen cover

---

## Technical Architecture

### Data Storage
- **Notes**: Stored in UserDefaults as JSON-encoded `[Note]` array
- **Settings**: AppStorage for all user preferences
- **Wallpapers**: File system storage in `Documents/NoteWall/`
  - `homeScreenImage.png`
  - `lockScreenWallpaper.png`
  - `lockScreenBackgroundSource.png`
- **Photos Library**: Optional storage with identifier tracking

### State Management
- **@StateObject**: For PaywallManager (singleton)
- **@AppStorage**: For persistent user preferences
- **@State**: For local view state
- **NotificationCenter**: For cross-view communication
  - `.requestWallpaperUpdate`
  - `.wallpaperGenerationFinished`
  - `.shortcutWallpaperApplied`
  - `.onboardingCompleted`

### Wallpaper Rendering
- **Canvas Size**: 1290 × 2796 pixels (iPhone Pro Max dimensions)
- **Rendering Engine**: UIGraphicsImageRenderer
- **Text Rendering**: NSAttributedString with adaptive sizing
- **Background Processing**: Image compositing with overlay effects
- **Brightness Detection**: Samples text area of background for optimal text color

### Shortcut Integration
- **Shortcut Name**: "Set NoteWall Wallpaper"
- **URL Scheme**: `shortcuts://run-shortcut?name=Set%20NoteWall%20Wallpaper`
- **File Reading**: Shortcut reads from `Documents/NoteWall/` directory
- **Notification Callback**: App receives notification when shortcut completes
- **URL Scheme Handler**: `notewall://wallpaper-updated`

---

## Onboarding Details

### Onboarding Version
- Current version: **3**
- Version tracking prevents showing outdated onboarding to existing users

### Onboarding Steps Breakdown

**Step 1: Welcome**
- Logo display
- Value proposition
- Three benefit cards with icons

**Step 2: Install Shortcut**
- PiP video guide (plays in background when app goes to background)
- Three instruction cards
- Opens Shortcuts app with iCloud link
- Auto-advances when user returns

**Step 3: Add Notes**
- Interactive note creation
- Scrollable list
- Add/remove notes
- Minimum 1 note required to continue

**Step 4: Choose Wallpapers**
- Home screen photo picker (iOS 16+)
- Home screen presets (Black/Gray)
- Lock screen background picker
- Lock screen presets
- Widget selection (Yes/No)
- "Edit Notes" button to go back

**Step 5: Allow Permissions**
- Video tutorial showing permission flow
- Emphasizes allowing ALL permissions
- Critical for Photos access

**Step 6: Overview**
- Animated checkmark
- Success confirmation
- Tips for automation
- "Start Using NoteWall" button

### Onboarding Completion
- Sets `hasCompletedSetup = true`
- Saves notes to AppStorage
- Generates first wallpaper
- Opens shortcut automatically
- Requests app review (after delay)
- Shows troubleshooting banner on home screen

---

## Wallpaper Generation Algorithm

### Font Sizing Logic
1. **Start with maximum font size** (140pt)
2. **Check if all notes fit** at that size
3. **If not, binary search** between min (52pt) and max (140pt)
4. **Find largest font size** where all notes fit
5. **Apply that size** to all notes

### Layout Calculation
- **Available Height** = Screen Height - Top Padding - Bottom Safe Area
- **Top Padding**: 
  - With widgets: 1030px
  - Without widgets: 850px
- **Bottom Safe Area**: 550px (above flashlight/camera)
- **Horizontal Padding**: 80px on each side
- **Text Max Width**: 1130px (1290 - 160)

### Note Separation
- **Line Spacing**: 15% of font size (within multi-line notes)
- **Note Gap**: 45% of font size (between different notes)
- Creates clear visual separation between notes

### Text Color Selection
- **Brightness Threshold**: 0.55
- **Below threshold**: White text
- **Above threshold**: Black text (90% opacity)
- **Sampling Method**: Samples text area region (38%-85% of image height, left 80% width)
- **Shadow**: Applied on photo backgrounds for contrast

---

## Privacy & Data

### Data Collection
- **Notes**: Stored locally only, never transmitted
- **Photos**: Processed locally, optional Photos library save
- **Analytics**: Anonymous crash reports and performance data
- **Purchases**: Handled by Apple/RevenueCat

### Data Storage
- **Local Only**: All personal content stays on device
- **No Cloud Sync**: Notes are not synced to any server
- **No Account Required**: App works completely offline
- **Photos Permission**: Only requested if user wants to save to Photos

### Privacy Policy Highlights
- All notes stored locally
- No personal data transmitted
- Anonymous analytics only
- GDPR compliant
- CCPA compliant

---

## Shortcut Requirements

### Shortcut Setup
- **Name**: "Set NoteWall Wallpaper"
- **iCloud Link**: `https://www.icloud.com/shortcuts/37aa5bd3a1274af1b502c8eeda60fbf7`
- **Required Actions**:
  1. Read wallpaper files from `Documents/NoteWall/`
  2. Set as lock screen wallpaper
  3. Return to app via URL scheme

### Shortcut Verification
- App can verify shortcut installation
- Shows setup guide if shortcut not found
- Can reset and reinstall shortcut

---

## App Store Information

### Contact
- **Support Email**: iosnotewall@gmail.com
- **Developer**: NoteWall Team

### Legal Documents
- **Terms of Use**: https://peat-appendix-c3c.notion.site/TERMS-OF-USE-2b7f6a63758f8067a318e16486b16f47
- **Privacy Policy**: https://peat-appendix-c3c.notion.site/PRIVACY-POLICY-2b7f6a63758f804cab16f58998d7787e
- **EULA**: https://peat-appendix-c3c.notion.site/END-USER-LICENSE-AGREEMENT-2b7f6a63758f80a58aebf0207e51f7fb

### App Store Links
- Share text includes App Store link
- App Store URL format: `https://apps.apple.com/app/notewall`

---

## Key User Flows

### First-Time User Flow
1. Download app
2. Onboarding (6 steps)
3. Add notes
4. Choose wallpapers
5. Allow permissions
6. First wallpaper generated
7. Shortcut opens automatically
8. User applies wallpaper
9. App review requested

### Daily Usage Flow
1. Open app
2. View/edit notes
3. Add new notes
4. Complete notes (swipe left)
5. Delete notes (swipe right)
6. Tap "Update Wallpaper"
7. Wallpaper generates
8. Shortcut opens
9. User applies new wallpaper

### Premium Upgrade Flow
1. User hits 3-export limit
2. Paywall appears (non-dismissible)
3. User selects plan (Yearly recommended)
4. Trial explanation (if yearly)
5. Purchase flow
6. Access granted
7. Unlimited exports enabled

---

## Special Features

### Edit Mode
- **Activation**: Tap ellipsis button or context menu
- **Multi-Select**: Tap notes to select
- **Bulk Actions**: Select All, Deselect All, Delete Selected
- **Visual Feedback**: Checkmarks on selected notes

### Note Completion
- **Swipe Left**: Mark as done
- **Visual**: Strikethrough with accent color
- **Auto-Update**: Wallpaper updates automatically when note completion changes
- **Restore**: Swipe left again to unmark

### Wallpaper Capacity
- **Dynamic**: Number of notes shown depends on:
  - Note length
  - Number of notes
  - Font size calculation
- **Warning**: Alert shown if trying to add note that won't fit
- **Visual Indicator**: Notes that appear on wallpaper can be marked (future feature)

### Troubleshooting
- **Banner**: Appears on home screen if wallpaper not showing
- **Guide**: Step-by-step troubleshooting view
- **Reset Option**: Can reset app to fresh install state
- **Shortcut Reinstall**: Option to reinstall shortcut

---

## RevenueCat Configuration

### API Key
- RevenueCat API Key: `appl_VuulGamLrpZVzgEymEJnflZNEzs`
- Verification Mode: Informational

### Entitlements
- **Entitlement ID**: "Notewall+"
- **Active Check**: Via RevenueCat customer info

### Packages
- Sorted by priority: Monthly → Annual → Lifetime
- Fallback pricing if packages unavailable:
  - Monthly: €6.99
  - Yearly: €14.99
  - Lifetime: €24.99

---

## Design System

### Typography
- **Headlines**: System font, rounded design, bold
- **Body**: System font, regular weight
- **Captions**: System font, smaller size
- **Notes on Wallpaper**: System font, heavy weight (adaptive size)

### Spacing
- **Padding**: 16-24px standard
- **Card Padding**: 16-20px
- **Section Spacing**: 20-28px
- **List Item Padding**: 16px vertical, 20px horizontal

### Border Radius
- **Small**: 8-12px (buttons, small cards)
- **Medium**: 16-20px (cards, containers)
- **Large**: 24-28px (large cards, modals)
- **Logo**: 26-44px (rounded rectangle)

### Shadows
- **Light**: `Color.black.opacity(0.05-0.12)`, radius 6-10
- **Medium**: `Color.black.opacity(0.18-0.25)`, radius 12-18
- **Accent Glow**: `Color.appAccent.opacity(0.3-0.6)`, radius 20-30

---

## Performance Considerations

### Image Processing
- Wallpapers rendered at full resolution (1290×2796)
- Background images scaled to cover canvas
- Text rendering optimized with attributed strings
- File system caching for wallpaper images

### State Management
- Lazy loading of notes
- Efficient AppStorage updates
- Background processing for wallpaper generation
- Debounced updates for note changes

### Memory Management
- Images released after rendering
- Efficient file I/O
- Proper cleanup of video players
- Background task management

---

## Future Possibilities

### Potential Features (Not Yet Implemented)
- Cloud sync for notes
- Multiple wallpaper sets
- Scheduled wallpaper updates
- Widget support
- Apple Watch companion
- iPad support
- Export/share wallpapers
- Note templates
- Rich text notes
- Image notes
- Voice notes
- Reminders integration
- Calendar integration

### Technical Improvements
- Background wallpaper updates
- Faster rendering
- Better error handling
- Offline mode enhancements
- Accessibility improvements
- Localization support

---

## Marketing Messaging

### Value Propositions
1. **"Turn Every Pickup Into Focus"** - You pick up your phone 498× per day. Each one becomes a reminder.
2. **"Keep Your Goals Always in Sight"** - Lock screen becomes a visual cue you can't ignore.
3. **"Beat Scrolling Before It Starts"** - See your goals before distractions.

### Target Audience
- Productivity enthusiasts
- Goal-oriented individuals
- People who forget tasks
- Users seeking visual reminders
- Minimalist productivity app users

### Key Differentiators
- **Visual Reminder System**: Not just another to-do app
- **Lock Screen Integration**: Always visible, no app opening needed
- **Beautiful Design**: Custom wallpapers with your notes
- **Simple & Focused**: No complex features, just notes on lock screen
- **Privacy-First**: All data local, no cloud required

---

## Technical Specifications

### App Bundle
- **Bundle Identifier**: (from project structure)
- **Version**: (from Info.plist)
- **Build**: (from Info.plist)

### File Structure
```
NoteWall/
├── Assets.xcassets/
│   ├── AppAccent.colorset/
│   ├── AppIcon.appiconset/
│   ├── OnboardingLogo.imageset/
│   └── arrow.imageset/
├── ContentView.swift
├── NoteWallApp.swift
├── OnboardingView.swift
├── PaywallView.swift
├── SettingsView.swift
├── Models.swift
├── PaywallManager.swift
├── StoreKitManager.swift
├── WallpaperRenderer.swift
└── [Other supporting files]
```

### Dependencies
- RevenueCat SDK
- SwiftUI (iOS 15+)
- UIKit
- StoreKit 2
- PhotosUI (iOS 16+)

---

## Summary

NoteWall is a beautifully designed iOS productivity app that solves the problem of forgetting by making your goals impossible to ignore. With its lock screen integration, adaptive design, and premium subscription model, it offers a unique approach to personal productivity and goal tracking.

The app emphasizes simplicity, privacy, and visual appeal, making it stand out in the crowded productivity app market. Its freemium model with a hard paywall after 3 exports creates a clear value proposition for upgrading to NoteWall+.

---

*This document contains all known information about NoteWall as of the current codebase. Use this as comprehensive context for creating a website, marketing materials, or documentation.*

