#SingleInstance, force
#NoEnv

Gui, Login:Add, Text, x6 y10 w250 h20 , Bitte geben sie ihren Namen und Ihr Passwort ein
Gui, Login:Add, Edit, x6 y30 w250 h20 vLoginName, Name
Gui, Login:Add, Edit, x6 y50 w250 h20 vPassword, Password
Gui, Login:Add, Button, x6 y70 w90 h20 gLoginCheck, OK
Gui, Login:Add, Button, x166 y70 w90 h20 gLoginAbbruch, Abbrechen
Gui, Login:+LabelLogin -Caption
Gui, Login: +LastFound
Gui, Login:Show, w267 h103, Login
return

LoginAbbruch:
LoginClose:
LoginEscape:
ExitApp

LoginCheck:
Gui, Login:Submit, NoHide
CheckURL = localhost/accountcheck.php?name=%LoginName%&pass=%Password%
Checksumme:=UrlDownloadToVar(CheckURL)
IfInString, Checksumme, Fehler {
	IfInString, Checksumme, Gesperrt {
		;Do it
	} else {
		MsgBox, 0, FEHLER, Der Login scheiterte aus fogendem grund `n`n%Checksumme%
		Reload
	}
} else {
	MsgBox. 0, Info Der Login war richtig
}
return

;Funktion UrlDownloadToVar START
UrlDownloadToVar(URL, UserAgent = "", Proxy = "", ProxyBypass = "") { 
    pFix:=a_isunicode ? "W" : "A" 
    hModule := DllCall("LoadLibrary", "Str", "wininet.dll") 

    AccessType := Proxy != "" ? 3 : 1 
    ;INTERNET_OPEN_TYPE_PRECONFIG                    0   // use registry configuration 
    ;INTERNET_OPEN_TYPE_DIRECT                       1   // direct to net 
    ;INTERNET_OPEN_TYPE_PROXY                        3   // via named proxy 
    ;INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY  4   // prevent using java/script/INS 

    io := DllCall("wininet\InternetOpen" . pFix 
    , "Str", UserAgent ;lpszAgent 
    , "UInt", AccessType 
    , "Str", Proxy 
    , "Str", ProxyBypass 
    , "UInt", 0) ;dwFlags 

    iou := DllCall("wininet\InternetOpenUrl" . pFix 
    , "UInt", io 
    , "Str", url 
    , "Str", "" ;lpszHeaders 
    , "UInt", 0 ;dwHeadersLength 
    , "UInt", 0x80000000 ;dwFlags: INTERNET_FLAG_RELOAD = 0x80000000 // retrieve the original item 
    , "UInt", 0) ;dwContext 

    If (ErrorLevel != 0 or iou = 0) { 
        DllCall("FreeLibrary", "UInt", hModule) 
        return 0 
    } 

    VarSetCapacity(buffer, 10240, 0) 
    VarSetCapacity(BytesRead, 4, 0) 

    Loop 
    { 
        ;http://msdn.microsoft.com/library/en-us/wininet/wininet/internetreadfile.asp 
        irf := DllCall("wininet\InternetReadFile", "UInt", iou, "UInt", &buffer, "UInt", 10240, "UInt", &BytesRead) 
        VarSetCapacity(buffer, -1) ;to update the variable's internally-stored length 

        BytesRead_ = 0 ; reset 
        Loop, 4  ; Build the integer by adding up its bytes. (From ExtractInteger-function) 
            BytesRead_ += *(&BytesRead + A_Index-1) << 8*(A_Index-1) ;Bytes read in this very DllCall 

        ; To ensure all data is retrieved, an application must continue to call the 
        ; InternetReadFile function until the function returns TRUE and the lpdwNumberOfBytesRead parameter equals zero. 
        If (irf = 1 and BytesRead_ = 0) 
            break 
        Else ; append the buffer's contents 
        { 
           ; a_isunicode ? buffer:=StrGet(&buffer, "CP0") 
            Result .= SubStr(buffer, 1, BytesRead_ * (a_isunicode ? 2 : 1)) 
        } 

        /* optional: retrieve only a part of the file 
        BytesReadTotal += BytesRead_ 
        If (BytesReadTotal >= 30000) ; only read the first x bytes 
        break                      ; (will be a multiple of the buffer size, if the file is not smaller; trim if neccessary) 
        */ 
    } 

    DllCall("wininet\InternetCloseHandle",  "UInt", iou) 
    DllCall("wininet\InternetCloseHandle",  "UInt", io) 
    DllCall("FreeLibrary", "UInt", hModule) 
   return % result 
}
;Funktion UrlDownloadToVar END
