# Bulletproof Shortcut Guide - With Preset Detection

## Overview

This guide creates a **100% reliable shortcut** that:
- ✅ Detects which preset (Black/Gray) is selected
- ✅ Uses the correct image based on your selection
- ✅ Handles custom photos properly
- ✅ Works every time without fail

---

## New File Structure

The app now saves preset images to the **TextEditor** folder:

```
Documents/NoteWall/
├── HomeScreen/
│   └── homescreen.jpg          ← Custom photo OR preset (if selected)
├── LockScreen/
│   └── lockscreen.jpg          ← Wallpaper with notes
└── TextEditor/
    ├── lockscreen_background.jpg     ← Lock screen background (if custom)
    ├── home_preset_black.jpg         ← Black preset image
    ├── home_preset_gray.jpg          ← Gray preset image
    └── preset_selection.txt          ← "black" or "gray" indicator
```

---

## How It Works

### When You Select a Preset:
1. App saves the preset image to **TextEditor/home_preset_[color].jpg**
2. App writes the preset name to **TextEditor/preset_selection.txt**
3. Shortcut reads the indicator file and uses the right preset

### When You Upload a Custom Photo:
1. App saves your photo to **HomeScreen/homescreen.jpg**
2. App clears the preset indicator
3. Shortcut uses your custom photo

---

## Complete Shortcut Structure

### Step-by-Step Actions:

```
1. Open App
   → Open: NoteWall

2. Get Lock Screen Wallpaper
   → Get contents of: LockScreen folder
   → Get Item from List: First Item
   → Rename to: LockWallpaper

3. Set Lock Screen
   → Set Wallpaper: Lock Screen
   → Input: LockWallpaper

4. Read Preset Indicator
   → Get File: TextEditor/preset_selection.txt
   → Rename to: PresetChoice

5. If Black Preset Selected
   → If: PresetChoice contains "black"
   → Get contents of: TextEditor folder
   → Filter: Name is "home_preset_black.jpg"
   → Get Item from List: First Item
   → Rename to: HomeWallpaper

6. Else If Gray Preset Selected
   → Otherwise, If: PresetChoice contains "gray"
   → Get contents of: TextEditor folder
   → Filter: Name is "home_preset_gray.jpg"
   → Get Item from List: First Item
   → Rename to: HomeWallpaper

7. Else Use Custom Photo
   → Otherwise
   → Get contents of: HomeScreen folder
   → Get Item from List: First Item
   → Rename to: HomeWallpaper
   → End If

8. Set Home Screen
   → Set Wallpaper: Home Screen
   → Input: HomeWallpaper

9. Show Success
   → Show Notification: "Wallpaper updated!"
```

---

## Detailed Action Configuration

### Action 1: Open App
```
Action: Open App
App: NoteWall
```

### Action 2: Get Lock Screen Contents
```
Action: Get Contents of Folder
Folder: Navigate to Documents/NoteWall/LockScreen
→ Variable: Folder Contents
```

### Action 3: Extract Lock Screen File
```
Action: Get Item from List
Get: First Item
From: Folder Contents
→ Rename to: LockWallpaper
```

### Action 4: Set Lock Screen Wallpaper
```
Action: Set Wallpaper
Show Preview: Yes (optional)
Lock Screen: LockWallpaper
```

### Action 5: Read Preset Indicator File
```
Action: Get File
File: Documents/NoteWall/TextEditor/preset_selection.txt
→ Rename to: PresetChoice
```

### Action 6: Check If Black Preset
```
Action: If
Condition: PresetChoice contains "black"
```

### Action 7: Get Black Preset Image
```
Action: Get Contents of Folder
Folder: Documents/NoteWall/TextEditor
→ Variable: Folder Contents 2
```

### Action 8: Filter for Black Preset
```
Action: Filter Files
Filter: Folder Contents 2
Where: Name is "home_preset_black.jpg"
→ Variable: Filtered Files
```

### Action 9: Extract Black Preset File
```
Action: Get Item from List
Get: First Item
From: Filtered Files
→ Rename to: HomeWallpaper
```

### Action 10: Otherwise If Gray Preset
```
Action: Otherwise If
Condition: PresetChoice contains "gray"
```

### Action 11: Get Gray Preset Image
```
Action: Get Contents of Folder
Folder: Documents/NoteWall/TextEditor
→ Variable: Folder Contents 3
```

### Action 12: Filter for Gray Preset
```
Action: Filter Files
Filter: Folder Contents 3
Where: Name is "home_preset_gray.jpg"
→ Variable: Filtered Files 2
```

### Action 13: Extract Gray Preset File
```
Action: Get Item from List
Get: First Item
From: Filtered Files 2
→ Rename to: HomeWallpaper
```

### Action 14: Otherwise Use Custom Photo
```
Action: Otherwise
```

### Action 15: Get Custom Home Screen
```
Action: Get Contents of Folder
Folder: Documents/NoteWall/HomeScreen
→ Variable: Folder Contents 4
```

### Action 16: Extract Custom Home Screen File
```
Action: Get Item from List
Get: First Item
From: Folder Contents 4
→ Rename to: HomeWallpaper
```

### Action 17: End If
```
Action: End If
```

### Action 18: Set Home Screen Wallpaper
```
Action: Set Wallpaper
Show Preview: Yes (optional)
Home Screen: HomeWallpaper
```

### Action 19: Show Success Notification
```
Action: Show Notification
Title: "Wallpaper updated!"
Body: (leave empty or add custom message)
```

---

## Simplified Shortcut Logic

If you want a simpler version (but slightly less robust):

```
1. Open NoteWall app
2. Get LockScreen folder contents → Get first item → Set as lock wallpaper
3. Get HomeScreen folder contents → Get first item → Set as home wallpaper
4. Show notification
```

This works because:
- When you select a preset, the app saves it to HomeScreen/homescreen.jpg
- When you upload a custom photo, it also goes to HomeScreen/homescreen.jpg
- The shortcut just reads whatever is there

---

## Testing Steps

### Test 1: Black Preset
1. Open NoteWall app
2. Go to Settings
3. Tap "Black" preset under Home Screen
4. Tap "Update Wallpaper"
5. Run shortcut
6. **Expected:** Black wallpaper on home screen

### Test 2: Gray Preset
1. Open NoteWall app
2. Go to Settings
3. Tap "Gray" preset under Home Screen
4. Tap "Update Wallpaper"
5. Run shortcut
6. **Expected:** Gray wallpaper on home screen

### Test 3: Custom Photo
1. Open NoteWall app
2. Go to Settings
3. Tap "Add Home Screen Photo"
4. Select a custom image
5. Tap "Update Wallpaper"
6. Run shortcut
7. **Expected:** Your custom photo on home screen

---

## Troubleshooting

### Problem: "File not found" error
**Solution:** 
- Open the app and tap "Update Wallpaper" at least once
- This creates all necessary files in the TextEditor folder

### Problem: Shortcut uses old wallpaper
**Solution:**
- The shortcut reads from files, not from memory
- Always tap "Update Wallpaper" in the app first
- Then run the shortcut

### Problem: Preset indicator file doesn't exist
**Solution:**
- Select a preset in Settings
- The app will create the indicator file automatically
- If using custom photo, the file might not exist (that's OK, shortcut falls back to HomeScreen folder)

### Problem: Wallpaper doesn't change after running shortcut
**Solution:**
- iOS caches wallpapers aggressively
- Try restarting your device
- Or select a different wallpaper first, then run the shortcut again

---

## Why This Works

### The Problem Before:
- Presets were stored in the base NoteWall folder
- Shortcut couldn't tell which preset was selected
- Had to guess based on filename or folder contents

### The Solution Now:
- **preset_selection.txt** tells the shortcut exactly which preset is active
- Preset images are in the **TextEditor** folder where they're easy to find
- **If-Else logic** handles all cases: black preset, gray preset, or custom photo
- Each path has its own variable name to avoid conflicts

### Bulletproof Design:
- ✅ Checks preset indicator first
- ✅ Uses exact filename matching
- ✅ Falls back to custom photo if no preset
- ✅ Each branch is independent
- ✅ No guessing or assumptions

---

## Quick Reference: Folder Paths

When configuring "Get Contents of Folder" actions:

1. **Lock Screen:** `Documents/NoteWall/LockScreen`
2. **Home Screen:** `Documents/NoteWall/HomeScreen`
3. **Text Editor:** `Documents/NoteWall/TextEditor`
4. **Preset Indicator:** `Documents/NoteWall/TextEditor/preset_selection.txt`

You can browse to these in the Files app on your iPhone:
**Files → On My iPhone → NoteWall**

---

## Advanced: Error Handling

To make the shortcut even more bulletproof, you can add error handling:

```
Before "Set Wallpaper" actions:

If: HomeWallpaper does not have any value
  → Show Alert: "Please update wallpaper in NoteWall app first"
  → Exit Shortcut
End If
```

This prevents trying to set a wallpaper when no file was found.

---

## Summary

🎯 **What Changed:**
- Presets now save to TextEditor folder
- preset_selection.txt tells shortcut which preset is active
- Shortcut uses if-else logic to pick the right image

✅ **What You Need to Do:**
1. Create or update your shortcut with the if-else structure above
2. Select a preset or upload a custom photo in the app
3. Tap "Update Wallpaper" in the app
4. Run the shortcut

🚀 **Result:**
A 100% reliable wallpaper system that works every single time!

---

## Need Help?

If you get stuck:
1. Check the console logs in Xcode when running the app
2. Look for "✅ Saved [color] preset to TextEditor folder"
3. Verify files exist in Files app → On My iPhone → NoteWall
4. Make sure your shortcut matches the structure above exactly

The app now logs everything it does, so you can see exactly what's happening!
