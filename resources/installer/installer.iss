; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; NOTE: The following variables must be set on the command line:
;    'AppNameOverride'
;    'AppPublisherOverride'
;    'AppURLOverride'
;    'AppExeNameOverride'
;    'ApplicationFilesPath'
;    'OutputPath'
;    'AppVersionOverride'
;    'OutputBaseFilenameOverride'
;    'LicenseFileOverride'

; NOTE: Use the following syntax on the command line to define a variable value:
; /DMyAppVersion=1.0.0

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{7D9BD81A-BD85-449C-8F08-1B46EE8CABC0}
ArchitecturesInstallIn64BitMode=x64
AppName={#AppNameOverride}
AppVersion={#AppVersionOverride}
VersionInfoVersion={#AppVersionOverride}
AppVerName={#AppNameOverride} {#AppVersionOverride}
AppPublisher={#AppPublisherOverride}
AppPublisherURL={#AppURLOverride}
AppSupportURL={#AppURLOverride}
AppUpdatesURL={#AppURLOverride}
DefaultDirName={pf}\{#AppNameOverride}
DisableDirPage=yes
DisableProgramGroupPage=yes
DefaultGroupName={#AppNameOverride}
AllowNoIcons=yes
;LicenseFile={#LicenseFileOverride}
OutputBaseFilename={#OutputBaseFilenameOverride}
Compression=lzma2/max
SolidCompression=yes
OutputDir={#OutputPath}
UninstallDisplayIcon={app}\{#AppExeNameOverride}
SetupLogging=yes
; Disable auto closing of application because the app handles it.
CloseApplications=no
; Makes Windows Explorer refresh all icons after installer finishes. Fixes missing icon in start menu.
; https://stackoverflow.com/questions/44076985/create-desktop-link-icon-after-the-run-section-of-inno-setup
ChangesAssociations=yes
SetupIconFile=images\icon256.ico
WizardImageFile=images\arland.bmp
WizardSmallImageFile=images\icon-small.bmp

[InstallDelete]
; Remove any previous versions of extracted applications from squibbles.
Type: filesandordirs; Name: "{app}\bin"

[Messages]
SetupAppTitle = {#AppNameOverride} {#AppVersionOverride}
SetupWindowTitle = {#AppNameOverride} {#AppVersionOverride}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
;Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "{#ApplicationFilesPath}\*"; DestDir: "{app}\bin"; Flags: ignoreversion createallsubdirs recursesubdirs

[Icons]
Name: "{autoprograms}\{#AppNameOverride}"; Filename: "{app}\bin\{#AppExeNameOverride}";
;Name: "{group}\{cm:UninstallProgram,{#AppNameOverride}}"; Filename: "{uninstallexe}"
;Name: "{commondesktop}\{#AppNameOverride}"; Filename: "{app}\{#AppExeNameOverride}"; Tasks: desktopicon

[Run]
;Filename: "{app}\{#AppExeNameOverride}"; Description: "{cm:LaunchProgram,{#StringChange(AppNameOverride, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
; The double quotes logic here is insane but needs to be that way to support spaces
; https://stackoverflow.com/questions/23611855/inno-setup-spaces-and-double-quote-in-run/23611986#23611986
;Filename: "C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "Add-MpPreference -ExclusionPath ""\""{app}\bin\"""; Flags: runhidden
; Runs program to XOR and extract Launcher and dll.
Filename: "{app}\bin\squibbles.exe"; Flags: runhidden

[UninstallRun]
; Adds {app}\bin directory as an exclusion path so that Windows Defender doesn't try to delete.
; Windows Defender does not like how we do process injection.
;Filename: "C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "Remove-MpPreference -ExclusionPath ""\""{app}\bin\"""; Flags: runhidden

[UninstallDelete]
Type: filesandordirs; Name: "{app}\bin"
Type: dirifempty; Name: "{app}"
