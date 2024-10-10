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
IF "%num%"=="3" (start cmd/1_russia_blacklist_YOUTUBE)
IF "%num%"=="4" (CALL 1_russia_blacklist_YOUTUBE_ALT)
IF "%num%"=="5" (CALL 0_russia_update_blacklist_file.bat)
IF "%num%"=="6" (goto services_delete)
pause
exit
:all_servises
CALL 2_service_install_russia_YOUTUBE
CALL 2_service_goodbye_discord
pause
exit
:all_servises_alt
CALL 2_service_install_russia_blacklist_YOUTUBE_ALT.cmd
CALL 2_service_goodbye_discord.bat
pause
exit
:services_delete
CALL 3_service_remove_blacklist_youtube.cmd
CALL 3_service_remove_discord.bat
pause
exit