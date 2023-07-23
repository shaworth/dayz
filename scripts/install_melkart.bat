@echo off

echo "Starting"

:: Steam UserID
set "login=REDACTED_CHANGE_ME"
echo        login: %login%

:: Mod ID within the Steam Workshop
set "modid=2716445223"
echo        modid: %modid%

:: Client side Mod name
set "modname=Melkart_Beta"
echo      modname: %modname%

:: Steam ID 
set "dayzid=223350"
echo       dayzid: %dayzid%

:: Steam ID used when downloading workshop items
set "dayzwsid=221100"
echo     dayzwsid: %dayzwsid%

:: Where steam is installed
set "steamcmdpath=%UserProfile%\steamcmd"
echo steamcmdpath: %steamcmdpath%

:: Path of template and server directory 
set "basepath=%UserProfile%\Documents\dayz"
echo     basepath: %basepath%

:: Where the dayz server is installed
set "serverpath=%basepath%\server1"
echo   serverpath: %serverpath%

:: Source of config and mission files
set "cfgpath=%basepath%\template1"
echo      cfgpath: %cfgpath%

:: Location of mod after install
set "modpath=%serverpath%\steamapps\workshop\content\%dayzwsid%\%modid%"
echo      modpath: %modpath%
echo =============================================================================

@echo on

:: "Install / Update DayZ"
%steamcmdpath%\steamcmd +force_install_dir %serverpath%\ +login %login% +app_update %dayzid% validate +quit

:: "Install / Update Mod"
%steamcmdpath%\steamcmd +force_install_dir %serverpath%\ +login %login% +workshop_download_item %dayzwsid% %modid% +quit

:: "Copy Mod"
mkdir %serverpath%\@%modname%\
xcopy %modpath%\ %serverpath%\@%modname%\ /s /e /y

:: "Copy config and mission files"
xcopy %cfgpath%\ %serverpath%\ /s /e /y

:: "Update keys"
xcopy %serverpath%\@%modname%\keys\*.bikey %serverpath%\keys\ /s /e /y

