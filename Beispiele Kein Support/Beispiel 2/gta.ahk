;====================Für GTA benötigt====================

#IfWinActive, GTA:SA:MP
#UseHook
#SingleInstance, Force

Hotkey, Enter, Off
Hotkey, Escape, Off

+t::
~T::
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Hotkey, t, Off
return

~NumpadEnter::
~Enter::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
Return

Escape::
Suspend Permit
Suspend Off
SendInput {Escape}
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return
