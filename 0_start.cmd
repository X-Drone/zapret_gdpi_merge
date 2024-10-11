@echo off
chcp 65001 >nul

echo "1 install discord & youtube services"
echo "2 install alternative discord & youtube services"
echo "3 open youtube unblocker"
echo "4 open alternative youtube ublocker"
echo "5 update blocked hosts"
echo "6 deintall discord & youtube services"
set /p num="Choose the option: "
IF "%num%"=="1" (goto all_servises)
IF "%num%"=="2" (goto all_servises_alt)
IF "%num%"=="3" (powershell -Command "Start-Process cmd '/c %~dp0/1_russia_blacklist_YOUTUBE.bat' -Verb runAs")
IF "%num%"=="4" (powershell -Command "Start-Process cmd '/c %~dp0/1_russia_blacklist_YOUTUBE_ALT.bat' -Verb runAs")
IF "%num%"=="5" (powershell -Command "Start-Process cmd '/c %~dp0/0_russia_update_blacklist_file.bat' -Verb runAs")
IF "%num%"=="6" (goto services_delete)
pause
exit
:all_servises
powershell -Command "Start-Process cmd '/c %~dp0/2_service_install_russia_blacklist_YOUTUBE.cmd' -Verb runAs"
powershell -Command "Start-Process cmd '/c %~dp0/2_service_goodbye_discord.bat' -Verb runAs"
pause
exit
:all_servises_alt
powershell -Command "Start-Process cmd '/c %~dp0/2_service_install_russia_blacklist_YOUTUBE_ALT.cmd' -Verb runAs"
powershell -Command "Start-Process cmd '/c %~dp0/cmd/2_service_goodbye_discord.bat' -Verb runAs"
pause
exit
:services_delete
powershell -Command "Start-Process cmd '/c %~dp0/3_service_remove_blacklist_youtube.cmd' -Verb runAs"
powershell -Command "Start-Process cmd '/c %~dp0/3_service_remove_discord.bat' -Verb runAs"
pause
exit