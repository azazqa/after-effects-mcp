@echo off
echo ================================================
echo After Effects MCP - Build and Install
echo ================================================
echo.

echo [1/4] Pulling latest changes from Git...
git pull
if errorlevel 1 (
    echo Error: Git pull failed
    pause
    exit /b 1
)
echo Git pull completed successfully.
echo.

echo [2/4] Installing dependencies...
call npm install
if errorlevel 1 (
    echo Error: npm install failed
    pause
    exit /b 1
)
echo Dependencies installed successfully.
echo.

echo [3/4] Building project...
call npm run build
if errorlevel 1 (
    echo Error: Build failed
    pause
    exit /b 1
)
echo Build completed successfully.
echo.

echo [4/4] Installing bridge to After Effects 2024...
call npm run install-bridge -- "C:\Program Files\Adobe\Adobe After Effects 2024"
if errorlevel 1 (
    echo Error: Bridge installation failed
    echo You may need to run this script as Administrator
    pause
    exit /b 1
)
echo.

echo ================================================
echo Installation completed successfully!
echo ================================================
echo.
echo Next steps:
echo 1. Open After Effects 2024
echo 2. Go to Edit ^> Preferences ^> Scripting ^& Expressions
echo 3. Enable "Allow Scripts to Write Files and Access Network"
echo 4. Restart After Effects
echo 5. Open the bridge panel: Window ^> mcp-bridge-auto.jsx
echo.
pause