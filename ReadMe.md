# Office 365 CDN 操作サンプル
このリポジトリでは、PowerShellを利用してOffice 365 CDNを操作するサンプルを掲載しています。

# 実行に必要な環境
実行にはPowerShellとSharePoint Online管理シェルが必要です。  
以下のPowerShellコマンドでSharePoint Online管理シェルがインストール済みかどうかを確認できます。  
```
Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select Name,Version  
```
インストールするには以下のPowerShellコマンドを実行します。  
```
Install-Module -Name Microsoft.Online.SharePoint.PowerShell  
```
# 実行方法
1.CreateCred.batを実行し、操作に利用するアカウントとパスワードを入力
2.Creact-CDN.bat / Get-CDN.bat / Remove-CDN.bat のうち目的に合ったものを実行

# 注意
各PowerShellファイル内ではオプションを固定書きしている箇所があります。  
例えばCDN作成時にキャッシュ対象とする拡張子やフォルダを固定で書いています。  
これらはあくまでサンプルですので、用途に合うよう適宜書き換えてください。