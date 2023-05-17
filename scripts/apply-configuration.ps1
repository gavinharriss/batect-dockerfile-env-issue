$secretKey = "$(New-Guid)"

$settingsToReplace = @(
    @{ xpath = "//appSettings/add[@key='SecretKeyFromEnv']"; attribute = "value"; value = [Environment]::GetEnvironmentVariable("SECRET_KEY") },
    @{ xpath = "//appSettings/add[@key='ValueFromHardCoded']"; attribute = "value"; value = "HARD-CODED-VALUE" }
)

foreach ($configFilePath in $args) {
    $doc = (Get-Content $configFilePath) -as [Xml]

    foreach ($setting in $settingsToReplace) {
        $node = $doc.SelectSingleNode($setting.xpath)
        if ($node -ne $null) {
            $node.SetAttribute($setting.attribute, $setting.value)
        }
    }

    $doc.Save($configFilePath)
}
