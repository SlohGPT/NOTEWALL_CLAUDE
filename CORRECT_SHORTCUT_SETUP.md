# Correct Shortcut Setup - Using "Get contents of folder"

## The Problem with Your Current Setup

You're using **"Get contents of folder"** which returns ALL files in the folder as a list. When you pass this to "Set Wallpaper", it doesn't know which file to use.

## The Correct Solution

You need to **get the first file** from the folder contents, or better yet, **filter by name**.

## Fixed Shortcut Structure

Here's the correct way to set it up:

### For Lock Screen:

```
1. Get contents of LockScreen
   → This returns all files in the folder

2. Get Item from List
   - Get: First Item
   - From: Folder Contents
   → This gets lockscreen.jpg (the only file in the folder)
   - Rename variable to: LockWallpaper

3. Set Wallpaper
   - Lock Screen: LockWallpaper
   - Show Preview: Yes
```

### For Home Screen:

```
4. Get contents of HomeScreen
   → This returns all files in the folder

5. Get Item from List
   - Get: First Item
   - From: Folder Contents
   → This gets homescreen.jpg (the only file in the folder)
   - Rename variable to: HomeWallpaper

6. Set Wallpaper
   - Home Screen: HomeWallpaper
   - Show Preview: Yes
```

## Step-by-Step Instructions

### Step 1: Fix Lock Screen Section

1. Keep your "Get contents of LockScreen" action
2. **Add new action after it:**
   - Search for **"Get Item from List"**
   - Tap to add it
3. Configure it:
   - Get: **First Item**
   - From: **Folder Contents** (should auto-select from previous action)
4. Tap the variable name and rename to **"LockWallpaper"**
5. Update "Set Wallpaper" action:
   - Change from "Folder Contents" to **"LockWallpaper"**

### Step 2: Fix Home Screen Section

1. Keep your "Get contents of HomeScreen" action
2. **Add new action after it:**
   - Search for **"Get Item from List"**
   - Tap to add it
3. Configure it:
   - Get: **First Item**
   - From: **Folder Contents** (should auto-select from previous action)
4. Tap the variable name and rename to **"HomeWallpaper"**
5. Update "Set Wallpaper" action:
   - Change from "Folder Contents" to **"HomeWallpaper"**

## Complete Shortcut Flow

```
┌─────────────────────────────────────┐
│ 1. Open App: NoteWall               │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 2. Get contents of                  │
│    📁 LockScreen                    │
│    → Folder Contents                │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 3. Get Item from List               │
│    Get: First Item                  │
│    From: Folder Contents            │
│    → LockWallpaper                  │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 4. Set Wallpaper                    │
│    🔒 Lock Screen: LockWallpaper    │
│    ☑️ Show Preview: Yes             │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 5. Get contents of                  │
│    📁 HomeScreen                    │
│    → Folder Contents                │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 6. Get Item from List               │
│    Get: First Item                  │
│    From: Folder Contents            │
│    → HomeWallpaper                  │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 7. Set Wallpaper                    │
│    🏠 Home Screen: HomeWallpaper    │
│    ☑️ Show Preview: Yes             │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ 8. Show Notification                │
│    "Wallpaper updated!"             │
└─────────────────────────────────────┘
```

## Alternative: Use "Get File" (Better Method)

If you want a cleaner solution, use **"Get File"** action instead:

### How to Find "Get File":

1. In Shortcuts, tap **+** to add action
2. Search for: **"file"**
3. Look for the action that says: **"Get File"** (not "Get contents" or "Get folder")
4. If you don't see it, try searching: **"get file from"**

### Using "Get File":

```
1. Get File
   - Tap "File" button
   - Navigate to: On My iPhone → NoteWall → LockScreen
   - Select: lockscreen.jpg
   - This creates a bookmark to the specific file
   → Variable: LockWallpaper

2. Set Wallpaper
   - Lock Screen: LockWallpaper
```

This is cleaner because it gets the exact file, not the folder contents.

## Why Your Current Setup Doesn't Work

**Current:**
```
Get contents of LockScreen → Folder Contents
Set Wallpaper to Folder Contents ❌
```

**Problem:** "Folder Contents" is a list of files, not a single image file. "Set Wallpaper" needs a single image.

**Fixed:**
```
Get contents of LockScreen → Folder Contents
Get First Item from Folder Contents → LockWallpaper
Set Wallpaper to LockWallpaper ✅
```

**Solution:** Extract the first (and only) file from the folder contents list.

## Testing

After making these changes:

1. Save the shortcut
2. Open NoteWall app
3. Add a note
4. Tap "Update Wallpaper"
5. The shortcut should run and show the wallpaper preview
6. Tap "Set" to apply it

## Troubleshooting

### "No items in list" error
- The folder is empty
- Go to NoteWall and tap "Update Wallpaper" first
- Check Files app to verify files exist

### "Invalid file type" error
- The file isn't an image
- This shouldn't happen if you're using the app correctly
- Try regenerating the wallpaper

### Still shows "Folder Contents" in Set Wallpaper
- You forgot to add the "Get Item from List" action
- The "Set Wallpaper" action needs to use the extracted file, not the folder contents

## Quick Checklist

- [ ] Added "Get Item from List" after each "Get contents of" action
- [ ] Set to get "First Item" from "Folder Contents"
- [ ] Renamed variables to "LockWallpaper" and "HomeWallpaper"
- [ ] Updated "Set Wallpaper" actions to use the new variables (not "Folder Contents")
- [ ] Tested the shortcut - it works!
