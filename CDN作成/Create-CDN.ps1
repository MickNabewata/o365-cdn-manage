# ---------------------------------------
# �@�\  �FOffice 365 CDN�쐬
# �쐬�ҁF�n��
# �X�V�ҁF
# �쐬���F2019/06/13
# �X�V���F
# ---------------------------------------

# --------------------------------------------------------------------------------------
# �X�N���v�g�t�@�C���ւ̖��O�t�������̒�`
# --------------------------------------------------------------------------------------
Param(
	# �ڑ���h���C����
	[string] $domain,
	
	# �p�X���[�h�t�@�C���p�X (���O��CreateCred.bat�ō쐬���邱��
	[string] $credFilePath
)

# --------------------------------------------------------------------------------------
# �������Ŏg�p����֐��̒�`
# --------------------------------------------------------------------------------------

# �����̃`�F�b�N
function CheckArgs($parameters)
{
# �߂�l
$ret = $true

# ���b�Z�[�W�o��
[Console]::WriteLine("")
[Console]::WriteLine("�����`�F�b�N�����{���܂��B")
[Console]::WriteLine("   -----")

# �����`�F�b�N
if($null -eq $domain)
{
	[Console]::WriteLine("domain�p�����[�^�͏ȗ��ł��܂���B�ڑ���h���C�������w�肵�Ă��������B")
	
	$ret = $false
}
else
{
	[Console]::WriteLine("   domain�p�����[�^	�F" + $domain)
}

if($null -eq $credFilePath)
{
	[Console]::WriteLine("credFilePath�p�����[�^�͏ȗ��ł��܂���B�p�X���[�h�t�@�C���p�X���w�肵�Ă��������B (�p�X���[�h�t�@�C���͎��O��CreateCred.bat�ō쐬���Ă�������")
	
	$ret = $false
}
else
{
	[Console]::WriteLine("   credFilePath�p�����[�^	�F" + $credFilePath)
}

# ���b�Z�[�W�o��
[Console]::WriteLine("   -----")
[Console]::WriteLine("�����`�F�b�N���ʁF" + $ret)
[Console]::WriteLine("")

# �`�F�b�N���ʂ�ԋp
return $ret
}

# --------------------------------------------------------------------------------------
# ���C������
# --------------------------------------------------------------------------------------
function Main()
{
# SharePoint�Ǘ��V�F���̓ǂݍ���
Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking;

# SharePoint�e�i���g�ڑ�
[Console]::WriteLine("�e�i���g�ɐڑ����܂��B�h���C���F" + $domain + " �p�X���[�h�t�@�C���F" + $credFilePath)
$credentials = Import-Clixml $credFilePath
Connect-SPOService -Url https://$domain-admin.sharepoint.com -Credential $credentials

# CDN�擾
[Console]::WriteLine("Office 365 CDN��ݒ肵�܂��B")
Set-SPOTenantCdnEnabled -CdnType Private -Enable $true -NoDefaultOrigins
Set-SPOTenantCdnPolicy -CdnType Private -PolicyType IncludeFileExtensions -PolicyValue "css,eot,gif,tif,ico,icon,jpeg,jpg,jpe,jfif,png,bmp,dib,js,map,png,svg,ttf,woff"
Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl "/sites/sample/SiteAssets"
Add-SPOTenantCdnOrigin -CdnType Private -OriginUrl "/sites/sample/Style Library"

[Console]::WriteLine("---- Public ----")
Get-SPOTenantCdnEnabled -CdnType Public
[Console]::WriteLine("----------------")
[Console]::WriteLine("")
[Console]::WriteLine("---- Private ----")
Get-SPOTenantCdnEnabled -CdnType Private
[Console]::WriteLine("-------- Private Policies --------")
Get-SPOTenantCdnPolicies -CdnType Private
[Console]::WriteLine("-------- Private Origins ---------")
Get-SPOTenantCdnOrigins -CdnType Private
[Console]::WriteLine("----------------")

# ���b�Z�[�W
$now = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
[Console]::WriteLine($now + " " + "�������������܂����B")
}


# --------------------------------------------------------------------------------------
# �X�N���v�g�J�n���Ɏ��s����閽��
# --------------------------------------------------------------------------------------
[Console]::WriteLine("")
[Console]::WriteLine("------------------------------------")
[Console]::WriteLine("PowerShell�X�N���v�g���J�n���܂��B")
[Console]::WriteLine("")

try
{
# �����̃`�F�b�N
if(CheckArgs)
{
	# ���C������
	Main
}
}
catch
{
[Console]::WriteLine("�G���[���������܂����B" + $_.Exception.Message)
}
finally
{
[Console]::WriteLine("")
[Console]::WriteLine("PowerShell�X�N���v�g���I�����܂��B")
[Console]::WriteLine("------------------------------------")
[Console]::WriteLine("")
}
