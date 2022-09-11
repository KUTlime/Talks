$mySecret = ''
function Send-VerificationEmail
{
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Secret
    )

    process
    {
        $userName = 'wug-test-2022@seznam.cz'
        $password = $Secret | ConvertTo-SecureString -AsPlainText -Force
        $credentials = New-Object System.Management.Automation.PSCredential($userName, $password)
        Send-MailMessage -From $userName -To 'radek.zahradnik@msn.com' -Subject 'Verification' -Body 'It works.' -SmtpServer 'smtp.seznam.cz' -UseSsl -Port 587 -Credential $credentials -WarningAction:SilentlyContinue
        Write-Host -Message 'The email has been send.' -ForegroundColor:Green
    }
}

# Definice problému
Send-VerificationEmail -Secret $mySecret # <-- Potřebujeme se tady zbavit toho hesla v plaintextu

# Začneme s naivním řešením - heslo dáme mimo skript
@{Secret = $mySecret} | ConvertTo-Json | Out-File -FilePath 'Settings.json' -Encoding:unicode


