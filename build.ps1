<#
	.NOTES

	 Created with: 	VSCode
	 Created on:   	4/23/2017
     Edited on:     4/23/2017
	 Created by:   	Mark Kraus
	 Organization:
	 Filename:     	build.ps1

	.DESCRIPTION
		Build Initialization
#>
param ($Task = 'Default')

Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

$PSDefaultParameterValues['Install-Module:Scope'] = 'CurrentUser'

@(
    # Build Tools
    @{Name = 'Psake'; RequiredVersion = '4.7.0'}
    @{Name = 'Pester'; RequiredVersion = '4.3.1'; SkipPublisherCheck = $true}
    @{Name = 'PSDeploy'; RequiredVersion = '0.2.3'}
    @{Name = 'BuildHelpers'; RequiredVersion = '1.0.1'}
    @{Name = 'PSScriptAnalyzer'; RequiredVersion = '1.16.1'}
    @{Name = 'PlatyPS'; RequiredVersion = '0.9.0' }
    # Module Dependencies
    @{Name = 'BetterTls'; RequiredVersion = '0.1.0.0' }
    @{Name = 'configuration'; RequiredVersion = '1.2.0'; AllowClobber = $true }

) | Foreach-Object {
    $Params = $_
    $moduleExists = $null
    'Processing Module {0} Version = {1}' -f $Params.Name, $Params.RequiredVersion
    if ($ENV:APPVEYOR) {
        Install-Module -Force @Params
    } else {
        $moduleExists = Get-Module -ListAvailable $Params.Name |
            where-object {$_.Version -eq $Params.RequiredVersion}
        if (-not $moduleExists) {
            Install-Module -Force @Params
        }
    }
    Remove-Module -Force -Name $Params.Name -ErrorAction SilentlyContinue
    try {$Params.Remove('SkipPublisherCheck')}catch {}
    try {$Params.Remove('AllowClobber')}catch {}
    Import-Module -Global -Force @Params
}

Set-BuildEnvironment -ErrorAction SilentlyContinue
Set-BuildEnvironment -ErrorAction SilentlyContinue -Path src -Force
Set-BuildEnvironment -ErrorAction SilentlyContinue -Force
if ($env:ModuleName) {
    $ENV:BHProjectName = $env:ModuleName
}
$ENV:BHBuildOutput = Join-Path $ENV:BHProjectPath "bin\$ENV:BHProjectName"
$ENV:BHBinDir = Join-Path $ENV:BHProjectPath "bin"
if ( $env:PSModulePath -notmatch [regex]::Escape($ENV:BHBinDir)) {
    $env:PSModulePath = '{0}{1}{2}' -f $ENV:BHBinDir, [System.Io.Path]::PathSeparator, $env:PSModulePath
}

Enable-Tls -Tls12 -Confirm:$false -Verbose

Invoke-psake -buildFile .\psake.ps1 -taskList $Task -nologo
exit ([int](-not $psake.build_success))
