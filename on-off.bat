@echo off
set /p choice="ON ou OFF: "
echo.

if /i "%choice%"=="ON" GOTO mouseon
if /i "%choice%"=="OFF" GOTO mouseoff


:mouseoff
echo "-----------------------"
echo "| Desabilitando Mouse |"
echo "-----------------------"
echo.
powershell -c "$hcc = read-host Hostname; icm -Computername $hcc -Scriptblock {Get-PnpDevice -Class Mouse -Status OK | Disable-PnpDevice -Confirm:$false}"
goto end

:mouseon
echo "---------------------"
echo "| Habilitando Mouse |"
echo "---------------------"
echo.
powershell -c "$hcc = read-host Hostname; icm -Computername $hcc -Scriptblock {Get-PnpDevice -Class Mouse -Status Error | Enable-PnpDevice -Confirm:$false}"
goto end

:end
