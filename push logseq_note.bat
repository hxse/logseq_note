chcp 65001
cd %~dp0
@echo off
:loop

git remote set-url origin https://hxse:%note_github_token%@github.com/hxse/logseq_note.git

git pull --no-rebase

git add .
git diff-index --quiet HEAD --

if %errorlevel% equ 0 (
    echo no different
) else (
    echo check different
    git commit -m "auto update"
    git push
)


set /a s=30
echo:
echo:
echo wait %s% second
echo:
echo:
timeout /t %s% >nul
goto loop
