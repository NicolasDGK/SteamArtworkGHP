# Steam Artwork GIF Artwork Hex Patcher

A lightweight, zero-dependency Windows utility to automate the "Hex Trick" required for long Steam Artwork, Workshop Showcases, and Guides.

## 📖 Overview

When uploading GIFs to Steam profiles, the platform often enforces strict aspect ratio and height limits. By modifying the final byte of a GIF file from `0x3B` (the standard GIF trailer) to `0x21` (an extension block), you can bypass these restrictions to create "infinite" or long-format artworks.

This tool automates that tedious process for multiple files at once.

## ✨ Features

- **No Installation Required:** Uses a Batch-PowerShell hybrid that runs natively on Windows 10/11.
- **Batch Processing:** Patches all GIFs in a folder simultaneously.
- **Non-Destructive:** Creates an `/output` folder so your original files remain untouched.
- **Automatic Renaming:** Adds a `_hex` suffix to processed files for easy identification.

## 🚀 How to Use

1. **Download** the 'Steamartwork_patcher.bat' file.
2. **Place** the file into the folder containing your exported GIFs.
3. **Double-click** 'Steamartwork_patcher.bat'.
4. The script includes a safety prompt. Simply press Y to start or N to cancel
5. Your patched GIFs will be ready in the newly created `output` folder.
6. Upload to Steam using the corresponding browser console script (READ BELOW).

If you want to upload a long workshop, paste the provided code into the browser console:

$J('[name=consumer_app_id]').val(480);$J('[name=file_type]').val(0);$J('[name=visibility]').val(0);

However, if you want to upload a long guide, paste this code instead:

$J('[name=consumer_app_id]').val(480);$J('[name=file_type]').val(9);$J('[name=visibility]').val(0); 

## 🛠️ Technical Details

The script reads the binary data of the GIF. In the GIF89a specification, `0x3B` marks the end of the file. By changing it to `0x21`, the Steam upload validator ignores certain dimension checks while the browser still renders the GIF correctly.

**Built with:**
- Windows Batch
- PowerShell Core (Natively integrated)

## ⚖️ License

This project is licensed under the MIT License - see the LICENSE file for details.