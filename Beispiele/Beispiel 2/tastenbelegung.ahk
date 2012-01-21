tastenbelegung:
If (3open == "0")
{
	Gui, 1:Destroy
	Gui, 2:Destroy
	Gui, 3:Add, Picture, x-4 y0 w490 h380 , %Stammverzeichniss%Grafiken\bg-02.jpg
	Gui, 3:Add, Picture, x456 y10 w10 h10 geclose , %Stammverzeichniss%Grafiken\x.png
	Gui, 3:Add, Picture, x436 y10 w10 h10 gMainframemove BackgroundTrans, %Stammverzeichniss%Grafiken\move.png
	Gui, 3: Font, S8 Cred, Verdana
	Gui, 3: Add, Text, x16 y30 w150 h320 BackgroundTrans, %Box1%
	Gui, 3: Add, Text, x316 y30 w150 h320 BackgroundTrans, %Box2%
	Gui, 3: Add, Button, x196 y100 w110 h20 gstartseite, Startseite
	Gui, 3: Add, Button, x196 y140 w110 h20 geinstellung, Einstellung
	Gui, 3:+Label2 -Caption
	WinSet, Region, 0-0 w477 h377 R30-30
	Gui, 3: Show, w477 h377, Duxis Tastenbelegung
	3open = 1
}
Else
{
	Gui, 3:Destroy
	3open = 0
}

Return

tclose:
3Escape:
3Close:
ExitApp

startseite:
Gui, 3:-LastFound
Gui, 3:Destroy
3open = 0
Gui, 1:+LastFound
GuiID := WinExist()
Goto,Gui
Gui, 1:Show,  h377 w477, Duxis Keybinder
Return
