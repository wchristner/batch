@echo off
runas /user:%ComputerName%\administrator "mmc %systemroot%\system32\dsa.msc"
echo \\bh-miworks-srv2\PrintDrivers\Ricoh MP c6501 e7200 Dockside Color\Win 10 PS\English\Prntdrvr\Ps_drvr\Win_2K_XP_VISTA| clip
echo.
echo Path Copied to Clipboard
pause