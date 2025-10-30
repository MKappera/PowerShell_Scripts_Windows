<#
.SYNOPSIS
  Customizes Start Menu layout
#>

Write-Host "=== Customizing Start Menu ===" -ForegroundColor Cyan

$layoutXml = "C:\Scripts\Customization\StartLayout.xml"

@"
<LayoutModificationTemplate xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
  <DefaultLayoutOverride>
    <StartLayoutCollection>
      <defaultlayout:StartLayout GroupCellWidth="6">
        <start:Group Name="Admin Tools">
          <start:DesktopApplicationTile Size="2x2" DesktopApplicationLinkPath="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk"/>
          <start:DesktopApplicationTile Size="2x2" DesktopApplicationLinkPath="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Server Manager.lnk"/>
          <start:DesktopApplicationTile Size="2x2" DesktopApplicationLinkPath="%ProgramData%\Microsoft\Windows\Start Menu\Programs\System Tools\File Explorer.lnk"/>
        </start:Group>
      </defaultlayout:StartLayout>
    </StartLayoutCollection>
  </DefaultLayoutOverride>
</LayoutModificationTemplate>
"@ | Out-File $layoutXml -Encoding utf8

Import-StartLayout -LayoutPath $layoutXml -MountPath $env:SystemDrive\
Write-Host "Start Menu customized successfully." -ForegroundColor Green
