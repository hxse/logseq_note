cd %~dp0
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './sync logseq_note.ps1' -dir '%~dp0' -auto $true -sleep 15"
pause