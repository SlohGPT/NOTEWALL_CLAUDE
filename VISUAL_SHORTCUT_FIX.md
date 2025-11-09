# Visual Guide: Fix Your Shortcut in 2 Minutes

## What's Wrong

Your shortcut is passing **"Folder Contents"** (a list of files) to **"Set Wallpaper"** (which needs a single image file).

```
❌ WRONG:
Get contents of LockScreen → Folder Contents
                              ↓
Set Wallpaper to Folder Contents  ← This doesn't work!
```

```
✅ CORRECT:
Get contents of LockScreen → Folder Contents
                              ↓
Get First Item from List   → LockWallpaper (single file)
                              ↓
Set Wallpaper to LockWallpaper  ← This works!
```

## The Fix (2 Actions to Add)

You need to add **"Get Item from List"** between each pair of actions.

### Current Shortcut (Broken):
```
1. Open NoteWall
2. Get contents of LockScreen
3. Set Wallpaper [Folder Contents] ← WRONG
4. Get contents of HomeScreen  
5. Set Wallpaper [Folder Contents] ← WRONG
6. Show notification
```

### Fixed Shortcut (Working):
```
1. Open NoteWall
2. Get contents of LockScreen
3. Get Item from List [First Item] ← ADD THIS
4. Set Wallpaper [LockWallpaper] ← CHANGE THIS
5. Get contents of HomeScreen
6. Get Item from List [First Item] ← ADD THIS
7. Set Wallpaper [HomeWallpaper] ← CHANGE THIS
8. Show notification
```

## Step-by-Step Instructions

### Part 1: Fix Lock Screen

**Step 1:** Tap between "Get contents of LockScreen" and "Set Wallpaper"

**Step 2:** Tap the **+** button to add a new action

**Step 3:** Search for: **"Get Item from List"**

**Step 4:** Configure the new action:
- **Get:** Tap and select **"First Item"**
- **From:** Should automatically show **"Folder Contents"**

**Step 5:** Tap the variable name at the top and rename to: **"LockWallpaper"**

**Step 6:** Tap the "Set Wallpaper" action below

**Step 7:** Tap where it says **"Folder Contents"**

**Step 8:** Select **"LockWallpaper"** from the dropdown

### Part 2: Fix Home Screen

**Step 9:** Tap between "Get contents of HomeScreen" and "Set Wallpaper"

**Step 10:** Tap the **+** button to add a new action

**Step 11:** Search for: **"Get Item from List"**

**Step 12:** Configure the new action:
- **Get:** Tap and select **"First Item"**
- **From:** Should automatically show **"Folder Contents"**

**Step 13:** Tap the variable name at the top and rename to: **"HomeWallpaper"**

**Step 14:** Tap the "Set Wallpaper" action below

**Step 15:** Tap where it says **"Folder Contents"**

**Step 16:** Select **"HomeWallpaper"** from the dropdown

### Part 3: Test

**Step 17:** Tap **"Done"** to save

**Step 18:** Open NoteWall app

**Step 19:** Add a test note

**Step 20:** Tap **"Update Wallpaper"**

**Step 21:** Shortcut should run and show wallpaper preview

**Step 22:** Tap **"Set"** to apply

## What Each Action Does

### "Get contents of folder"
- Returns: **List of all files** in the folder
- Example: `[lockscreen.jpg]` (a list with one file)
- Problem: "Set Wallpaper" can't use a list

### "Get Item from List"
- Takes: A list (like Folder Contents)
- Returns: **A single item** from that list
- Example: `lockscreen.jpg` (the actual file)
- Solution: Extracts the file from the list

### "Set Wallpaper"
- Takes: **A single image file**
- Does: Sets it as your wallpaper
- Needs: The actual file, not a list

## Why This Happens

iOS Shortcuts is very literal:
- **Folder Contents** = "Here's a box with files in it"
- **First Item** = "Here's the actual file from that box"
- **Set Wallpaper** needs the file, not the box

## Verification

After fixing, your shortcut should look like this:

```
┌─────────────────────────────────────┐
│ Open App: NoteWall                  │
└─────────────────────────────────────┘
         ↓
┌─────────────────────────────────────┐
│ Get contents of: LockScreen         │
│ → Folder Contents                   │
└─────────────────────────────────────┘
         ↓
┌─────────────────────────────────────┐
│ Get Item from List                  │ ← YOU ADDED THIS
│ First Item from Folder Contents     │
│ → LockWallpaper                     │
└─────────────────────────────────────┘
         ↓
┌─────────────────────────────────────┐
│ Set Wallpaper                       │
│ Lock Screen: LockWallpaper          │ ← YOU CHANGED THIS
└─────────────────────────────────────┘
         ↓
┌─────────────────────────────────────┐
│ Get contents of: HomeScreen         │
│ → Folder Contents                   │
└─────────────────────────────────────┘
         ↓
┌─────────────────────────────────────┐
│ Get Item from List                  │ ← YOU ADDED THIS
│ First Item from Folder Contents     │
│ → HomeWallpaper                     │
└─────────────────────────────────────┘
         ↓
┌─────────────────────────────────────┐
│ Set Wallpaper                       │
│ Home Screen: HomeWallpaper          │ ← YOU CHANGED THIS
└─────────────────────────────────────┘
         ↓
┌─────────────────────────────────────┐
│ Show Notification                   │
│ "Wallpaper updated!"                │
└─────────────────────────────────────┘
```

## Common Mistakes

### ❌ Mistake 1: Not adding "Get Item from List"
Result: Still passes Folder Contents to Set Wallpaper

### ❌ Mistake 2: Not changing the Set Wallpaper input
Result: Still uses Folder Contents instead of the extracted file

### ❌ Mistake 3: Getting "Last Item" instead of "First Item"
Result: Might work, but "First Item" is more reliable

### ✅ Correct: Add the action AND update the input

## Still Not Working?

### Error: "No items in list"
**Cause:** The folder is empty  
**Fix:** Go to NoteWall app, tap "Update Wallpaper" to create the files first

### Error: "Invalid type"
**Cause:** The variable type is wrong  
**Fix:** Make sure you're getting "First Item" from "Folder Contents", not something else

### No error, but wallpaper doesn't change
**Cause:** You didn't update the "Set Wallpaper" input  
**Fix:** Tap "Set Wallpaper", tap the input field, select the new variable

## Quick Test

Before testing with the app, you can test the shortcut manually:

1. Open Shortcuts app
2. Tap your shortcut
3. If it runs without errors and shows a wallpaper preview, it's fixed!
4. If you get an error, check which action failed and fix that part

## Summary

**What you have:** Folder Contents (list of files)  
**What you need:** Single image file  
**Solution:** Extract first item from the list  
**Actions to add:** 2x "Get Item from List"  
**Actions to modify:** 2x "Set Wallpaper" inputs
