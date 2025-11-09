# Fix Your Shortcut RIGHT NOW - Simple Steps

## The Problem
Your shortcut says "file not found" because it's using the wrong way to get files.

## The Solution (5 Minutes)

### Step 1: Open Files App
1. Open the **Files** app on your iPhone
2. Tap **On My iPhone**
3. Look for the **NoteWall** folder
4. If you don't see it, go to NoteWall app and tap "Update Wallpaper" first

### Step 2: Verify Files Exist
Inside the NoteWall folder, you should see:
- **HomeScreen** folder → contains `homescreen.jpg`
- **LockScreen** folder → contains `lockscreen.jpg`
- **TextEditor** folder → contains `lockscreen_background.jpg` (if you picked a photo)

### Step 3: Edit Your Shortcut
1. Open **Shortcuts** app
2. Find **"Set NoteWall Wallpaper"**
3. Tap to edit it

### Step 4: Fix the "Get File" Actions

You have TWO "Get File" actions that are broken. Here's how to fix them:

#### Fix Lock Screen File:
1. Find the action that says: `Get file from LockScreen at path lockscreen.jpg`
2. **Delete this entire action** (swipe left or tap X)
3. Tap **+** to add new action
4. Search for **"Get File"**
5. Tap **"File"** in the new action
6. Browse to: **On My iPhone → NoteWall → LockScreen**
7. Select **lockscreen.jpg**
8. Tap the variable name and rename it to **"LockWallpaper"**

#### Fix Home Screen File:
1. Find the action that says: `Get file from HomeScreen at path homescreen.jpg`
2. **Delete this entire action** (swipe left or tap X)
3. Tap **+** to add new action
4. Search for **"Get File"**
5. Tap **"File"** in the new action
6. Browse to: **On My iPhone → NoteWall → HomeScreen**
7. Select **homescreen.jpg**
8. Tap the variable name and rename it to **"HomeWallpaper"**

### Step 5: Fix the "Set Wallpaper" Actions

You have TWO "Set Wallpaper" actions. Update them:

#### First Set Wallpaper (for Lock Screen):
1. Tap the action
2. Make sure it says: **Set Wallpaper to File for Lock Screen**
3. Tap **"File"**
4. Select the variable **"LockWallpaper"** (from the dropdown)

#### Second Set Wallpaper (for Home Screen):
1. Tap the action
2. Make sure it says: **Set Wallpaper to File for Home Screen**
3. Tap **"File"**
4. Select the variable **"HomeWallpaper"** (from the dropdown)

### Step 6: Test It
1. Tap **Done** to save the shortcut
2. Go back to **NoteWall** app
3. Add a note (like "Test note")
4. Tap **"Update Wallpaper"**
5. The shortcut should run without errors!

## What Your Shortcut Should Look Like

```
┌─────────────────────────────────────┐
│ Open App: NoteWall                  │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ Get File                            │
│ 📁 lockscreen.jpg                   │
│ (from NoteWall/LockScreen)          │
│ → LockWallpaper                     │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ Set Wallpaper                       │
│ 🔒 Lock Screen: LockWallpaper       │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ Get File                            │
│ 📁 homescreen.jpg                   │
│ (from NoteWall/HomeScreen)          │
│ → HomeWallpaper                     │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ Set Wallpaper                       │
│ 🏠 Home Screen: HomeWallpaper       │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│ Show Notification                   │
│ "Wallpaper updated!"                │
└─────────────────────────────────────┘
```

## Why This Works

❌ **OLD WAY (Broken):**
- "Get file from folder at path filename.jpg"
- Uses folder names as paths (doesn't work in iOS)

✅ **NEW WAY (Works):**
- "Get File" → Browse to actual file
- Creates a bookmark to the file
- Works every time, even after app updates

## Still Not Working?

### Error: "File not found"
- Make sure you browsed to the file (don't type the path)
- Run "Update Wallpaper" in NoteWall first to create the files
- Check Files app to verify files exist

### Error: "Unable to make sandbox extension"
- You're still using the old "at path" method
- Delete those actions and use the browse method above

### Files don't exist
- Open NoteWall app
- Tap "Update Wallpaper"
- Wait for it to finish
- Check Files app again

## Quick Checklist

- [ ] Files exist in Files app (NoteWall folder)
- [ ] Deleted old "Get file from folder at path" actions
- [ ] Added new "Get File" actions by browsing to files
- [ ] Updated "Set Wallpaper" actions to use the new variables
- [ ] Tested the shortcut - it works!

## Need Help?

If you're still stuck, the issue is that you need to **browse to the file** instead of typing a path. iOS shortcuts can't use folder paths like "LockScreen/lockscreen.jpg" - you must browse to the actual file in the Files app.
