@echo off
REM One-click publish: regenerate manifest, stage everything, commit, push.
cd /d "%~dp0"

echo Regenerating manifest from icons folder...
python gen_manifest.py
if errorlevel 1 (
  echo.
  echo Manifest generation failed - aborting.
  pause
  exit /b 1
)

git add -A

REM Nothing to commit? Bail out cleanly.
git diff --cached --quiet
if not errorlevel 1 (
  echo.
  echo No changes to publish.
  pause
  exit /b 0
)

set "msg="
set /p "msg=Commit message: "
if "%msg%"=="" set "msg=Update quiz"

git commit -m "%msg%"
if errorlevel 1 (
  echo.
  echo Commit failed - aborting.
  pause
  exit /b 1
)

git push
if errorlevel 1 (
  echo.
  echo Push failed - check your connection or credentials.
  pause
  exit /b 1
)

echo.
echo Published! Live at https://ashgasparyancs.github.io/siege-operator-quiz/
pause
