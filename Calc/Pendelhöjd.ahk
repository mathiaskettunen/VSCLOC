#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Font, s8 cBlack Bold, Verdana
Gui, Add, Text, x20 y5 w180 h30, Önskad Hastighet. [M/s]
Gui, Add, Edit, x20 y20 w100 h20 vMyvar gEdit1

Gui, Add, Text, x20 y50 w180 h30, Starthöjd på pendel. [M]
Gui, Add, Edit, x20 y65 w100 h20 vMyv gEdit2

Gui, Add, Text, x150 y85 w100 h65, Höjd från samma plan som starthöjden är mätt. [M]
Gui Add, Progress, x150 y155 w37 BackgroundWhite
Gui Add, Text, x150 y155 w60 BackgroundTrans vTotal
Gui, Add, Text, x20 y100 w105 h60, Använd .(punkt) `n Ej , (kommatecken).

Gui, Show, w300 h200, Calc
return

Edit1:
Gui, Submit, NoHide
NewVar := Myvar
GuiControl,, Newvar, %Newvar%
gosub, SetTotal
return

Edit2:
Gui, Submit, NoHide
NewV := Myv
GuiControl,, Newv, %Newv%
gosub, SetTotal
return

SetTotal:
Total := 0
	Total := (NewVar*NewVar/19.634+NewV)
	Result := % RegExReplace(Total,"(\.\d{3})\d*","$1")
	GuiControl, , Total, %Result%
return

GuiClose:
ExitApp
