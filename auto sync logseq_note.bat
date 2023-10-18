cd %~dp0
if "%~1" == "" (
    SET /A sleep = 20
) else (
    SET /A sleep = %1
)
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './sync logseq_note.ps1' -d '%~dp0' -a 1 -s %sleep%"
pause