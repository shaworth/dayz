@echo off

cd %UserProfile%\Documents\dayz\server1

start "DayZ Server" DayZServer_x64.exe --dologs -netlog -freezecheck -adminLog -profiles=melkartprofile -config=serverDZ.cfg -port=2302 -cpuCount=6 -mod="@Melkart_beta"

cd %UserProfile%\Documents\dayz
