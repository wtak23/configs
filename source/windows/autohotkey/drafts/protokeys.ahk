;==============================================================================;
; GLOBAL VARIABLE JUNK
;------------------------------------------------------------------------------;
; ARGHHHHGHHH....AHK global/local variable rules are one of the most crazy
; uninintuitive thigns i've ever encountered in my coding life....
;------------------------------------------------------------------------------;
; - GOTTA USE #Persistent, a built-in variable in AHK...
; - global vars must be defined immediately after the #Persistent commands...
;==============================================================================;
    #Persistent
    ;~~~~~~~~~~~~~~~~~~~~~
    ;Global Variables
    ;~~~~~~~~~~~~~~~~~~~~~
    global ddd := 12
    global numRep:=80

    XButton1 & Mbutton::Send ^{LButton} ; <- open link in new tab
    XButton2 & MButton::Send ^{F5} ; refresh window


; script for prototyping my custom keys
;--------------------------------------------------------------------------
    ; Some notable hotkeys (for a full list: http://ahkscript.org/docs/Hotkeys.htm#Symbols)
    ; # : windows key
    ; ^ : control key
    ; ! : alt key
    ; + : shift key
    ;--------------------------------------------------------------------------
    ; I usualy use "win+s" via #s to test my protoscript (surprisingly, windows doesn't use this hot-key)
    ;**************************************************************************
    ; Numpad9::
    ; {
    ; Send, ^c
    ; Sleep 50
    ; Run, http://www.google.com/search?q=%clipboard%
    ; Return
    ; }; --------------------------------------------------;
    ; Numpad1::
    ; SysGet, Mon1, Monitor, 1
    ; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
    ; return

    ; Numpad2::
    ; SysGet, Mon1, Monitor, 2
    ; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
    ; return

    ; Numpad3::
    ; SysGet, Mon1, Monitor, 3
    ; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
    ; return
    ;***************************************************************************;
    ;==================================================;
    ; http://xahlee.info/mswin/autohotkey_examples.html
    ; set the default state of the lock keys
    ; SetCapsLockState, off
    ; SetNumLockState, on
    ; SetScrollLockState, off

    ; ; disable them
    ; $NumLock::Return
    ; $ScrollLock::Return
    ; $CapsLock::Return
    ;==================================================;

    ;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
    ; Numpad0::Send, {AppsKey}
    ;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
    ;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%;
    ;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%;
    ; ; Note: You can optionally release Capslock or the middle mouse button after
    ; ; pressing down the mouse button rather than holding it down the whole time.
    ; ; This script requires v1.0.25+.

    ; LAlt & LButton::
    ; CoordMode, Mouse  ; Switch to screen/absolute coordinates.
    ; MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    ; WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    ; WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
    ; if EWD_WinState = 0  ; Only if the window isn't maximized 
    ;     SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
    ; return

    ; EWD_WatchMouse:
    ; GetKeyState, EWD_LButtonState, LButton, P
    ; if EWD_LButtonState = U  ; Button has been released, so drag is complete.
    ; {
    ;     SetTimer, EWD_WatchMouse, off
    ;     return
    ; }
    ; GetKeyState, EWD_EscapeState, Escape, P
    ; if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
    ; {
    ;     SetTimer, EWD_WatchMouse, off
    ;     WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    ;     return
    ; }
    ; ; Otherwise, reposition the window to match the change in mouse coordinates
    ; ; caused by the user having dragged the mouse:
    ; CoordMode, Mouse
    ; MouseGetPos, EWD_MouseX, EWD_MouseY
    ; WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
    ; SetWinDelay, -1   ; Makes the below move faster/smoother.
    ; WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
    ; EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
    ; EWD_MouseStartY := EWD_MouseY
    ; return
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%;


;==============================================================================;
; Goal: improve the dumb brute force impelementation of my "code-dashers"
;------------------------------------------------------------------------------;
; References
; - http://ahkscript.org/docs/commands/Send.htm
; - http://ahkscript.org/docs/commands/Send.htm#SendPlayDetail
; - http://ahkscript.org/docs/commands/SetKeyDelay.htm
;==============================================================================;

;==============================================================================;
; Aha!!! I needed to change this parameter to get the annoying lag in the
; string display!!!!
;==============================================================================;
SetKeyDelay, 0

; 78 character list
dash_sharp1:="##############################################################################" 
dash_equal1:="==============================================================================" 
dash_minus1:="------------------------------------------------------------------------------"
dash_under1:="______________________________________________________________________________"
dash_slash1 :="/////////////////////////////////////////////////////////////////////////////"
dash_semic1 :=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
dash_plus1 :="++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
dash_star1 :="******************************************************************************"
dash_perc1 :="%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

::test::
SendInput {Raw}`/*%dash_sharp1%##/*`
return

; Now I don't get that nasty delay in each keystroke in the loop!
::ttt::
Loop 80{
    SendRaw `=`
}
Send `r
return

;------------------------------------------------------------------------------;
; http://ahkscript.org/docs/Variables.htm
; Use := for assigning numerical variables
;------------------------------------------------------------------------------;


::qqq::
    Send {= 80}`r
    return




;------------------------------------------------------------------------------;
; now do the above with variables
; - turned out more confusing than i expected....
; - FINALLY GOT THIS BEAST WORKING....argh....ahk syntactical rules kill me...
;------------------------------------------------------------------------------;

::eee::
    Loop %numRep% {
        SendRaw `=`
    }
    Send `r
    return

; loop not needed...this works
::fff::
    Send {= %numRep%}`r
    return


Capslock & T::MsgBox The value in the variable named Var is %numRep%

;------------------------------------------------------------------------------;
; can i invoke a function for hotstrings?  yes!
;------------------------------------------------------------------------------;
FcnTest(Key, nRep)
{
    SendInput {%Key% %nRep%}
}

::111::
    FcnTest("1",80)
    return

::===::
    FcnTest("=",80)
    return
