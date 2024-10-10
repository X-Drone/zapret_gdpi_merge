@echo off
chcp 65001 >nul
:: 65001 - UTF-8
pause
:: Path check
set scriptPath=%~dp0
set "path_no_spaces=%scriptPath: =%"
if not "%scriptPath%"=="%path_no_spaces%" (
    echo Path contains spaces. 
    echo Please, move script into the directory whithout spaces.
    pause
    exit /b
)

:: Admin rights check
echo This script should be run with administrator privileges.
echo Right click - run as administrator.
echo Press any key if you're running it as administrator.
pause

set BIN=%~dp0bin\
set ARGS=--wf-tcp=443 --wf-udp=443,50000-65535 ^
--filter-udp=443 --hostlist=\"%~dp0list-discord.txt\" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic=\"%BIN%quic_initial_www_google_com.bin\" --new ^
--filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic=\"%BIN%quic_initial_www_google_com.bin\" --new ^
--filter-tcp=443 --hostlist=\"%~dp0list-discord.txt\" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls=\"%BIN%tls_clienthello_www_google_com.bin\"

set SRVCNAME=zapret

net stop "%SRVCNAME%"
sc delete "%SRVCNAME%"
sc create "%SRVCNAME%" binPath= "%BIN%winws.exe %ARGS%" DisplayName= "zapret DPI bypass : winws1" start= auto depend= "GoodbyeDPI"
sc description "%SRVCNAME%" "zapret DPI bypass software"
sc start "%SRVCNAME%"

pause