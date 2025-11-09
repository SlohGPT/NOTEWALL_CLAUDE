# NoteWall Shortcut Setup Guide

## The Problem
Your shortcut is getting "file not found" errors because it's not using the correct file path format for iOS shortcuts.

## Current File Locations (from logs)
```
✅ Saved lock screen wallpaper to file system
   File path: /var/mobile/Containers/Data/Application/[APP-ID]/Documents/NoteWall/LockScreen/lockscreen.jpg
```

## How to Fix Your Shortcut

### Option 1: Use "Get File" with Bookmarks (RECOMMENDED)

This is the most reliable method:

1. **Delete your current shortcut actions** for getting files
2. **Add these actions instead:**

```
Action 1: Get File
- Tap "File" → Browse to: On My iPhone → NoteWall → LockScreen → lockscreen.jpg
- This creates a bookmark to the file
- Store in variable: LockWallpaper

Action 2: Get File  
- Tap "File" → Browse to: On My iPhone → NoteWall → HomeScreen → homescreen.jpg
- This creates a bookmark to the file
- Store in variable: HomeWallpaper

Action 3: Set Wallpaper
- Lock Screen: LockWallpaper
- Home Screen: HomeWallpaper
- Show Preview: Yes
```

### Option 2: Use Correct Path Format

If you want to use "Get file from path", use this format:

```
Action 1: Get File
- Service: iCloud Drive / On My iPhone
- File Path: NoteWall/LockScreen/lockscreen.jpg
- (NOT: /Documents/NoteWall/... or /var/mobile/...)

Action 2: Get File
- Service: iCloud Drive / On My iPhone  
- File Path: NoteWall/HomeScreen/homescreen.jpg
```

## Complete Working Shortcut

Here's the full shortcut that will work:

```
┌─────────────────────────────────────┐
│ 1. Comment                          │
│    "Get lock screen wallpaper"      │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 2. Get File                         │
│    📁 Bookmarked file:              │
│    NoteWall/LockScreen/             │
│    lockscreen.jpg                   │
│    → Variable: LockWallpaper        │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 3. Comment                          │
│    "Get home screen wallpaper"      │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 4. Get File                         │
│    📁 Bookmarked file:              │
│    NoteWall/HomeScreen/             │
│    homescreen.jpg                   │
│    → Variable: HomeWallpaper        │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 5. Set Wallpaper                    │
│    🔒 Lock Screen: LockWallpaper    │
│    🏠 Home Screen: HomeWallpaper    │
│    ☑️ Show Preview: On              │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 6. Show Notification                │
│    "Wallpaper updated!"             │
└─────────────────────────────────────┘
```

## Step-by-Step Setup Instructions

### 1. Open Shortcuts App
- Tap the Shortcuts app icon

### 2. Find Your Shortcut
- Find "Set NoteWall Wallpaper"
- Tap to edit it

### 3. Delete Broken Actions
- Delete any "Get file from [folder] at path" actions that are showing errors
- Keep the "Set Wallpaper" action

### 4. Add New Get File Actions

**For Lock Screen:**
1. Tap "+" to add action
2. Search for "Get File"
3. Tap "File" in the action
4. Navigate: On My iPhone → NoteWall → LockScreen
5. Select `lockscreen.jpg`
6. Tap the variable name and rename to "LockWallpaper"

**For Home Screen:**
1. Tap "+" to add action
2. Search for "Get File"
3. Tap "File" in the action
4. Navigate: On My iPhone → NoteWall → HomeScreen
5. Select `homescreen.jpg`
6. Tap the variable name and rename to "HomeWallpaper"

### 5. Update Set Wallpaper Action
1. Tap "Set Wallpaper" action
2. For Lock Screen: Select variable "LockWallpaper"
3. For Home Screen: Select variable "HomeWallpaper"
4. Enable "Show Preview" (optional)

### 6. Test the Shortcut
1. Go back to NoteWall app
2. Add a note
3. Tap "Update Wallpaper"
4. The shortcut should run without errors

## Troubleshooting

### "File not found" error
- Make sure you're browsing to the file in the Files app, not typing the path
- The file must exist before you can bookmark it
- Run "Update Wallpaper" in NoteWall first to create the files

### "Unable to make sandbox extension" error
- This means the shortcut can't access the file
- Use the bookmark method (Option 1) instead of path strings
- Make sure NoteWall has created the files first

### Files don't appear in Files app
- Open Files app
- Tap "On My iPhone"
- Look for "NoteWall" folder
- If it doesn't exist, run "Update Wallpaper" in the app first

## Why This Happens

iOS apps run in sandboxed containers with random IDs like:
```
/var/mobile/Containers/Data/Application/FC4933CA-D33D-4FEE-AFDA-0AE5BBFA1536/
```

This ID changes every time you reinstall the app, so hardcoded paths don't work.

**Solution:** Use file bookmarks instead of paths. Bookmarks work regardless of the container ID.

## Quick Test

1. Open Files app
2. Navigate to: On My iPhone → NoteWall
3. You should see folders: HomeScreen, LockScreen, TextEditor
4. Inside LockScreen: `lockscreen.jpg` (this is your wallpaper with notes)
5. Inside HomeScreen: `homescreen.jpg` (this is your home screen background)

If you don't see these files, go to NoteWall app and tap "Update Wallpaper" first.
