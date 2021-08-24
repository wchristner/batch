SET /P ANSWER=Do You Want to Install Dragon (Y/N)? 
if /i {%ANSWER%}=={y} (goto :dragonyes) 
if /i {%ANSWER%}=={yes} (goto :dragonYes)
if /i {%ANSWER%}=={n} (goto :q2)
if /i {%ANSWER%}=={no} (goto :q2)

goto :q2


goto :Dragon

:Dragon
start E:\Dragon-Offline\Install-Dragon.EXE

:q2
SET /P ANSWER=Do You Want to Install Offcie (Y/N)? 
if /i {%ANSWER%}=={y} (goto :OfficeYes) 
if /i {%ANSWER%}=={yes} (goto :OfficeYes)
if /i {%ANSWER%}=={n} (goto :continue)
if /i {%ANSWER%}=={no} (goto :continue) 
goto :office

:office
start E:\Corporate\setup.exe

:continue
net use x: /del
net use x: \\10.31.130.33\porterappshare
cd c:
echo off
taskkill /im msiexec.exe /f
taskkill /im msiexec.exe /f
taskkill /im msiexec.exe /f
taskkill /im msiexec.exe /f
echo on
MKDIR C:\Temp\Porter
msiexec /q ALLUSERS=2 /m MSI66HT4 /i "X:\porterapps\All\AFP\install_flash_player_11_active_x.msi"
msiexec /qn /i "X:\porterapps\All\PPS\Pulse.msi" /l* c:\temp\porter\pulse.log
start X:\porterapps\All\JRE.15008\jre-1_5_0_08-windows-i586-p.exe /s /v/qn ADDLOCAL=ALL IEXPLORER=1 AUTOUPDATECHECK=0 UPDATE=0 JAVAUPDATE=0 SYSTRAY=0 REBOOT=Suppress /L*+ C:\portersms.log
start X:\porterapps\All\JRE.16030\jre-6u30-windows-i586-s.exe /s static=1 REBOOT=suppress
start X:\porterapps\All\PMRS\MedRec.EXE
msiexec /q /i "X:\porterapps\All\CHS.ERS\CHS Event Reporting System.msi" /l C:\temp\Porter\ers20.log
msiexec /i "X:\porterapps\Clinical\Ora10g\Oracle Client 10g Express Edition.msi" /l*v c:\Temp\Porter\OracleXESetup.log /qb
msiexec /i "X:\porterapps\Clinical\NurseCall\NurseCall.msi" /L*v c:\temp\Porter\NurseCall.log /qb!
msiexec /i "X:\porterapps\Clinical\McKesson\HPF Webstation.msi" /l* c:\temp\porter\hpfwebstation.log /qn
msiexec /i "X:\porterapps\Clinical\McKesson\Merge PACS Viewer Software.msi" /l*v c:\temp\porter\PACS65.log /qb
msiexec /i "X:\porterapps\All\IBM-iSeries-7\image32\cwbinstall.msi" /qn CWBPRIMARYLANG=MRI2924
copy "C:\Program Files\IBM\Client Access\Emulator\Private\*.ws" "C:\Users\Public\Documents\IBM\"

xcopy E:\Athena\athenaNet.website C:\Users\Public\Desktop
xcopy E:\Athena\Lightspeed.website C:\Users\Public\Desktop

xcopy F:\Athena\athenaNet.website C:\Users\Public\Desktop
xcopy F:\Athena\Lightspeed.website C:\Users\Public\Desktop



msiexec /i "E:\Porter HMS Sessions\HMS Sessions.msi"
ECHO OFF
ECHO .
ECHO Warning, after the following Vergence install, this PC will reboot!
ECHO .
pause
md c:\Vergence-install
copy X:\porterapps\Vergence\PSscript_V5.ps1 c:\Vergence-install
copy X:\porterapps\Vergence\setup.bat c:\Vergence-install

SET /P ANSWER=Do You Want to Install Vergence (Y/N)? 
if /i {%ANSWER%}=={y} (goto :vergenceyes) 
if /i {%ANSWER%}=={yes} (goto :vergenceYes) 
if /i {%ANSWER%}=={n} (goto :Exit)
if /i {%ANSWER%}=={no} (goto :Exit)
goto :Vergence

goto :Exit
Exit

:Vergence
c:
cd c:\vergence-install
powershell.exe -Executionpolicy Bypass -File PSscript_V5.ps1
pause
X:
cd\
C:
cd %ALLUSERSDESKTOP%
del "Horizon Clinicals.lnk"
net use X: /del
CLS
Echo Application Install complete
Echo Press Any Key to restart Device
Pause
shutdown -r -f -t 2

