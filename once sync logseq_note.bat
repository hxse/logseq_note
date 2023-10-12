cd %~dp0
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './sync logseq_note.ps1' -d '%~dp0' -a 0"
pause