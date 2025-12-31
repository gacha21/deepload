@echo off
chcp 65001 >nul

if "%1"=="admin" (
    setlocal EnableDelayedExpansion
    :menu
    cls
    echo.
    echo   ^</^> Deepload v0.0.1 ^(Beta^)
    echo.
    echo   Make a choice:
    echo   1. Download directly
    echo   0. Exit/Close
    echo.
    set "choice="
    set /p "choice= --> "

    if "!choice!"=="0" (
        exit
    )

    if "!choice!"=="1" (
        cls
        echo.
        echo     ^</^> Deepload v0.0.1 ^(Beta^)
        echo.
        echo     Enter a direct link to the file
        echo.
        set "url="
        set /p "url= --> "
        
        if "!url!"=="" (
            echo No URL entered!
            pause
            goto :menu
        )
        
        cls
        echo.
        echo     ^</^> Deepload v0.0.1 ^(Beta^)
        echo.
        echo     Downloading from: !url!
        echo.
        
        "%~dp0loader.exe" "!url!"
        
        echo.
        pause
        goto :menu
    )
    
    echo Invalid choice
    pause
    goto :menu
) else (
    echo Requesting administrator rights...
    powershell -Command "Start-Process cmd -ArgumentList '/c','""%~f0""','admin' -Verb RunAs"
    exit /b
)