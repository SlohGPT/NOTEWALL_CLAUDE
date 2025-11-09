# Simple Shortcut Guide - Works Every Time

## How It Works Now

✅ **Black preset** → Saved to `HomeScreen/homescreen.jpg`  
✅ **Gray preset** → Saved to `HomeScreen/homescreen.jpg`  
✅ **Custom photo** → Saved to `HomeScreen/homescreen.jpg`  

**Everything goes to the same place!** No complex logic needed.

---

## Your Shortcut (4 Simple Steps)

```
1. Open App
   → Open: NoteWall

2. Get Lock Screen
   → Get contents of: LockScreen folder
   → Get Item from List: First Item
   → Rename to: LockWallpaper

3. Set Lock Screen
   → Set Wallpaper: Lock Screen
   → Input: LockWallpaper

4. Get Home Screen
   → Get contents of: HomeScreen folder
   → Get Item from List: First Item
   → Rename to: HomeWallpaper

5. Set Home Screen
   → Set Wallpaper: Home Screen
   → Input: HomeWallpaper

6. Show Success
   → Show Notification: "Wallpaper updated!"
```

---

## Detailed Setup

### Action 1: Open NoteWall
```
Type: Open App
App: NoteWall
```

### Action 2: Get Lock Screen Contents
```
Type: Get Contents of Folder
Folder: Documents/NoteWall/LockScreen
```

### Action 3: Extract Lock Screen File
```
Type: Get Item from List
Get: First Item
From: Folder Contents
→ Rename to: LockWallpaper
```

### Action 4: Set Lock Screen
```
Type: Set Wallpaper
Lock Screen: LockWallpaper
Show Preview: Yes (optional)
```

### Action 5: Get Home Screen Contents
```
Type: Get Contents of Folder
Folder: Documents/NoteWall/HomeScreen
```

### Action 6: Extract Home Screen File
```
Type: Get Item from List
Get: First Item
From: Folder Contents
→ Rename to: HomeWallpaper
```

### Action 7: Set Home Screen
```
Type: Set Wallpaper
Home Screen: HomeWallpaper
Show Preview: Yes (optional)
```

### Action 8: Show Success
```
Type: Show Notification
Title: "Wallpaper updated!"
```

---

## Why This is Simple

### Before (Complex):
- ❌ Check preset indicator file
- ❌ If black, get black preset from TextEditor
- ❌ Else if gray, get gray preset from TextEditor
- ❌ Else get custom photo from HomeScreen
- ❌ Too many files, too many folders

### Now (Simple):
- ✅ Always get file from HomeScreen folder
- ✅ That's it!

---

## File Structure

```
Documents/NoteWall/
├── HomeScreen/
│   └── homescreen.jpg        ← THIS IS ALL YOU NEED
└── LockScreen/
    └── lockscreen.jpg        ← Lock screen with notes
```

---

## How the App Works

### When You Select Black Preset:
1. App creates black image
2. Saves to `HomeScreen/homescreen.jpg`
3. Done!

### When You Select Gray Preset:
1. App creates gray image
2. Saves to `HomeScreen/homescreen.jpg`
3. Done!

### When You Upload Custom Photo:
1. App saves your photo
2. Saves to `HomeScreen/homescreen.jpg`
3. Done!

**The shortcut doesn't need to know which one you chose - it just reads whatever is there!**

---

## Testing

### Test 1: Black Preset
1. Build and run the app
2. Go to Settings
3. Tap **Black** preset
4. Console should show:
   ```
   ✅ Saved Black preset to HomeScreen folder
      Path: HomeScreen/homescreen.jpg
   ```
5. Tap "Update Wallpaper"
6. Run shortcut
7. **Result:** Black home screen

### Test 2: Gray Preset
1. Tap **Gray** preset
2. Console shows:
   ```
   ✅ Saved Gray preset to HomeScreen folder
      Path: HomeScreen/homescreen.jpg
   ```
3. Tap "Update Wallpaper"
4. Run shortcut
5. **Result:** Gray home screen

### Test 3: Custom Photo
1. Tap "Add Home Screen Photo"
2. Select image
3. Tap "Update Wallpaper"
4. Run shortcut
5. **Result:** Your photo as home screen

---

## Troubleshooting

### "No items in list" error
- **Fix:** Tap "Update Wallpaper" in the app first

### Shortcut runs but nothing changes
- **Fix:** Make sure you tapped "Update Wallpaper" in the app
- Check Files app to verify `homescreen.jpg` exists

### Preset not saving
- **Fix:** This is now fixed - presets save directly to HomeScreen folder
- No complex directories to create

---

## Summary

🎯 **Simple Solution:**
- Everything saves to `HomeScreen/homescreen.jpg`
- No preset indicator files
- No TextEditor complexity
- Just works!

✅ **Your Shortcut:**
- 6 actions total (plus notification)
- Get lock screen → set it
- Get home screen → set it
- Done!

🚀 **Result:**
- Works with presets
- Works with custom photos
- No confusion
- No errors

---

## Quick Reference

**Folder Paths:**
- Lock: `Documents/NoteWall/LockScreen`
- Home: `Documents/NoteWall/HomeScreen`

**That's it!** Two folders, two files, one simple shortcut.
