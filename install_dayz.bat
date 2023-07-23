@echo off
set "steamcmdpath=C:\Users\shaworth\steamcmd"
set "serverpath=C:\Users\shaworth\Documents\dayz\server1"
set "login=REDACTED_CHANGE_ME" 
echo.
%steamcmdpath%\steamcmd +force_install_dir "%serverpath%" +login %login% %pass% +app_update 223350 validate +quit

