@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

if not exist "images" (
    echo Cartella /images non trovata!
    pause
    exit /b
)

echo [> images-manifest.json

setlocal enabledelayedexpansion
set first=1

for %%F in (images\*.jpg images\*.jpeg images\*.JPG images\*.JPEG) do (
    if !first! equ 0 (
        echo , >> images-manifest.json
    )
    for %%A in ("%%F") do (
        echo "%%~nxA">> images-manifest.json
    )
    set first=0
)

echo ] >> images-manifest.json

echo.
echo ✓ Manifest creato: images-manifest.json
echo.
pause
