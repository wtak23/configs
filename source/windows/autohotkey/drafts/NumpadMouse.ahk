; forked from http://www.autohotkey.com/board/topic/29597-no-mouse-today-a-numpad-mouse-replacement/page-2
#SingleInstance force
#NoEnv
#InstallKeybdHook
Coordmode, Mouse
Process Priority, , High
SetBatchLines -1
SetKeyDelay, -1
SetMouseDelay, -1
SetWinDelay, 1
NumPadMult = 0
NumPadDiv = 1
D = 1
U = -1
Toggle = 1
Return

Insert::reload
F10::suspend

NumPad4::Send {Browser_Back}
NumPad6::Send {Browser_Forward}

NumPadRight::
NumPadLeft::
NumPadUp::
NumPadDown::
If Down
{
	Down = 0
	Send {Shift Up}
} else {
	Down = 1
	Send {Shift Down}
}
return

NumPad5::
NumPad2::
NumPad1::
NumPad3::
Settimer, ReduceSpeed, Off
Loop
{
	DirX = 0
	DirY = 0
	If (A_Index = 6)
		Speed += 2
	Else If (Speed < 20)
		Speed += Mod(A_Index, 2)
	GetKeyState, NumPad5, NumPad5
	GetKeyState, NumPad2, NumPad2
	GetKeyState, NumPad1, NumPad1
	GetKeyState, NumPad3, NumPad3
	If (NumPad5 = "D")
		DirY -= %Speed%
	If (NumPad2 = "D")
		DirY = %Speed%
	If (NumPad1 = "D")
		DirX -= %Speed%
	If (NumPad3 = "D")
		DirX = %Speed%
	If not DirX and not DirY
		Break
	If (Toggle + 1)
		MouseMove, DirX, DirY, , R
	Else {
		WinGetPos, WinX, WinY, , , A
		WinMove, A, , WinX + DirX, WinY + DirY
	}
	Sleep 1
}
Settimer, ReduceSpeed, -50
Return

ReduceSpeed:
Speed = 0
return

NumPad0::
Send {LButton Down}
LBState = D
While (LBState = "D")
	GetKeyState, LBState, NumPad0
Send {LButton Up}
return

NumPadDot::
Send {RButton Down}
RBState = D
While (RBState = "D")
	GetKeyState, RBState, NumPadDot
Send {RButton Up}
return

NumPad8::
Send {MButton Down}
MBState = D
While (MBState = "D")
	GetKeyState, MBState, NumPad8
Send {MButton Up}
return

NumPadSub::
WUState = D
While (WUState = "D")
{
	MouseClick, WU, , , Ceil(A_Index / 3)
	Sleep 50
	GetKeyState, WUState, NumPadSub
}
return

NumPadAdd::
WDState = D
While (WDState = "D")
{
	MouseClick, WD, , , Ceil(A_Index / 3)
	Sleep 50
	GetKeyState, WDState, NumPadAdd
}
return

NumPadMult = 0
NumPadDiv = 1
D = 1
U = -1

NumPadMult::
NumPadDiv::
ActiveWin := WinActive("A")
WinGet, Maxed, MinMax, ahk_id %ActiveWin%
If Maxed
{
	WinRestore, ahk_id %ActiveWin%
	WinMove, ahk_id %ActiveWin%, , 0, 0, A_ScreenWidth, A_ScreenHeight
}
WinGetPos, x, y, w, h, ahk_id %ActiveWin%
IState = D
If Not CheckKey
	Goto WinResize
If %A_ThisHotkey%
	CheckKey = NumPadMult
Else
	CheckKey = NumPadDiv
Return

WinResize:
If (%A_ThisHotkey% <> 0)
	CheckKey = NumPadMult
Else
	CheckKey = NumPadDiv
While (IState = "D")
{
	GetKeyState, AState, %CheckKey%
	y := y - %AState% * A_Index, h := h + %AState% * A_Index
;	x := x - %AState% * A_Index, w := w + %AState% * A_Index
	If (w > A_ScreenWidth) or (h > A_ScreenHeight)
	{
		WinMaximize, ahk_id %ActiveWin%
		Break
	} Else
		WinMove, ahk_id %ActiveWin%, , x, y, w, h
	GetKeyState, IState, %A_ThisHotKey%
	Sleep 1
}
CheckKey =
Return

NumSevenTimer:
Double = 0
If (MouseWin <> ActiveWin)
	Return
Else If Maxed
	WinRestore, ahk_id %ActiveWin%
Else
	WinMaximize, ahk_id %ActiveWin%
Return

NumPad7::
If Double
{
	SetTimer, NumSevenTimer, Off
	If (MouseWin <> ActiveWin) {
		ActiveWin := MouseWin
		Goto NumSevenTimer
	} Else {
		Double = 0
		WinMinimize, ahk_id %ActiveWin%
		Return
	}
}
MouseGetPos, , , MouseWin
WinGetTitle, WinTitle, ahk_id %MouseWin%
If Not WinTitle
{
	Send {Click}
	Return
}
ActiveWin := WinActive("A")
Double = 1
SetTimer, NumSevenTimer, -200
If (MouseWin <> ActiveWin)
	WinActivate, ahk_id %MouseWin%
WinGet, Maxed, MinMax, ahk_id %MouseWin%
Return

NumPad9::Winclose, A

NumLock::
Toggle := !Toggle
If Toggle
{
	ToolTip, Moving Mouse...
	Settimer, ToolTipOff, -1000
} else {
	ToolTip, Moving Window...
	Settimer, ToolTipOff, -1000
}
Return

ToolTipOff:
ToolTip
Return