@echo off

rem �Œ蕶����
set SCRIPTFILEPATH=%~dp0Get-CDN.ps1
set LOG=%~dp0Get-CDN.log
set EXECUTION_POLICY=UnRestricted

rem �X�N���v�g���s�p�����[�^
set DOMAIN="contoso"
set CRED_FILE_PATH="userCred.xml"

rem ���s
cd %~dp0
echo script_start >> %LOG%
powershell -ExecutionPolicy %EXECUTION_POLICY% -Command %SCRIPTFILEPATH% -domain %DOMAIN% -credFilePath %CRED_FILE_PATH% >> %LOG%
echo script_end >> %LOG%

@echo on