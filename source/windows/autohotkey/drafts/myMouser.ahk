#Persistent

;=========================================================================;
; - map footkey to all 4 modifier keys (safe to say these won't overlap with other hotkeys)
; {#^!+}
; # : windows key
; ^ : control key
; ! : alt key
; + : shift key
;=========================================================================;
; #^!+
;-------------------------------------------------------------------------;
; Mouse movement
;-------------------------------------------------------------------------;
; #^!+a::
; SetKeyDelay, -0
; SetMouseDelay, -0
; MouseMove, -10, 0, 0, R
; return

; #^!+f::
; SetKeyDelay, -0
; SetMouseDelay, -0
; MouseMove, 10, 0, 0, R
; return

; #^!+s::
; SetKeyDelay, -0
; SetMouseDelay, -0
; MouseMove, 0, 10, 0, R
; return

; #^!+e::
; SetKeyDelay, -0
; SetMouseDelay, -0
; MouseMove, 0, -10, 0, R
; return
;-------------------------------------------------------------------------;
; Mouse movement: ver2
;-------------------------------------------------------------------------;
SetDefaultMouseSpeed, 0 
;===============================================================================
; ; SETTINGS
; ; --------
; ; futz with these to get the movement as you'd like it
; ; the settings below are the ones i liked after just
; ; a few minutes of playing around
distance = 10         ; - how far the mouse moves each turn of the timer
multiplier = 1.025    ; - how much farther (exponentially) the mouse moves in
                      ;   a direction the longer you hold that direction down
CFKM = 10             ; - how often to run the timer

SetTimer, CheckForKeyMouse, %CFKM%

return

CheckForKeyMouse:
    if not GetKeyState("Shift") ;GetKeyState("Alt") and GetKeyState("Win") and GetKeyState("Ctrl"))
        return
    if not GetKeyState("Alt")
        return
    if not GetKeyState("LWin")
        return        
    if not GetKeyState("Ctrl")
        return   
    ; GetKeyState("Down") ? (d*=multiplier) : (d:=1)
    ; GetKeyState("Up") ? (u*=multiplier) : (u:=1)
    ; GetKeyState("Right") ? (r*=multiplier) : (r:=1)
    ; GetKeyState("Left") ? (l*=multiplier) : (l:=1)  

    ; left
    GetKeyState("a") ? (l*=multiplier) : (l:=1)      
    ; right
    GetKeyState("f") ? (r*=multiplier) : (r:=1)
    ; up
    GetKeyState("e") ? (u*=multiplier) : (u:=1)
    ; down
    GetKeyState("s") ? (d*=multiplier) : (d:=1)


    y := (d-u) * distance
    x := (r-l) * distance
    MouseMove, x, y, , R
return
;===============================================================================

; distance = 22         ; - how far the mouse moves each turn of the timer
; multiplier = 1.02    ; - how much farther (exponentially) the mouse moves in
;                       ;   a direction the longer you hold that direction down
; CFKM = 10             ; - how often to run the timer

; SetTimer, CheckForKeyMouse, %CFKM%

; return

; CheckForKeyMouse:
;     #^!+j
;     ; GetKeyState("Down") ? (d*=multiplier) : (d:=1)
;     ; GetKeyState("Up") ? (u*=multiplier) : (u:=1)
;     ; GetKeyState("Right") ? (r*=multiplier) : (r:=1)
;     ; GetKeyState("Left") ? (l*=multiplier) : (l:=1)  

;     ; left
;     GetKeyState("j") ? (l*=multiplier) : (l:=1)      
;     ; right
;     GetKeyState(";") ? (r*=multiplier) : (r:=1)
;     ; up
;     GetKeyState("l") ? (u*=multiplier) : (u:=1)
;     ; down
;     GetKeyState("k") ? (d*=multiplier) : (d:=1)


;     y := (d-u) * distance
;     x := (r-l) * distance
;     MouseMove, x, y, , R
; return
;===============================================================================

;---------------
#^!+r::Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.

; ;----------------
; ; left mouse click 
#^!+Enter::SendInput {LButton}
; #^!+j::SendInput {LButton}

; ; right mouse click (how to hold down: http://www.autohotkey.com/board/topic/95613-help-with-hold-down-right-mouse-button-autohotkey/)
; #^!+k::SendInput {Rbutton}
; #^!+Space::SendInput {Rbutton}
