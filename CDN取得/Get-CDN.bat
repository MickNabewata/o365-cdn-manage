@echo off

rem 固定文字列
set SCRIPTFILEPATH=%~dp0Get-CDN.ps1
set LOG=%~dp0Get-CDN.log
set EXECUTION_POLICY=UnRestricted

rem スクリプト実行パラメータ
set DOMAIN="contoso"
set CRED_FILE_PATH="userCred.xml"

rem 実行
cd %~dp0
echo script_start >> %LOG%
powershell -ExecutionPolicy %EXECUTION_POLICY% -Command %SCRIPTFILEPATH% -domain %DOMAIN% -credFilePath %CRED_FILE_PATH% >> %LOG%
echo script_end >> %LOG%

@echo on