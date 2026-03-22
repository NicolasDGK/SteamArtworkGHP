@echo off
setlocal
title Steam Artwork GIF Hex Patcher

echo --------------------------------------------------
echo      Steam Artwork GIF Hex Patcher 
echo --------------------------------------------------

:: Safety Confirmation Prompt
echo This will patch all GIFs in the current folder and create an 'output' subfolder.
choice /C YN /M "Do you want to proceed?"

:: If the user chooses 'N' (Option 2), the script exits
if errorlevel 2 (
    echo.
    echo Operation cancelled by user.
    pause
    exit
)

echo.
echo Starting process...
echo.

powershell -Command ^
    $files = Get-ChildItem -Filter *.gif; ^
    if ($files.Count -eq 0) { Write-Host 'No GIFs found in this folder.' -ForegroundColor Yellow; exit }; ^
    $outDir = New-Item -ItemType Directory -Force -Path 'output'; ^
    foreach ($file in $files) { ^
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName); ^
        if ($bytes[-1] -eq 0x3B) { ^
            $bytes[-1] = 0x21; ^
            $newName = $file.BaseName + '_hex' + $file.Extension; ^
            $outPath = Join-Path $outDir.FullName $newName; ^
            [System.IO.File]::WriteAllBytes($outPath, $bytes); ^
            Write-Host \"[OK] Processed: $($file.Name) -> $newName\" -ForegroundColor Green; ^
        } else { ^
            Write-Host \"[!] Skipped: $($file.Name) (Does not end in 3B)\" -ForegroundColor Cyan; ^
        } ^
    }; ^
    Write-Host '--- Process completed. Your GIF(s) are ready for upload ---' -ForegroundColor White

pause