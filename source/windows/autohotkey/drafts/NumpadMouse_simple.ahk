#Persistent
SetDefaultMouseSpeed, 0 

; SETTINGS
; --------
; futz with these to get the movement as you'd like it
; the settings below are the ones i liked after just
; a few minutes of playing around
distance = 10         ; - how far the mouse moves each turn of the timer
multiplier = 1.08     ; - how much farther (exponentially) the mouse moves in
                      ;   a direction the longer you hold that direction down
CFKM = 30             ; - how often to run the timer

SetTimer, CheckForKeyMouse, %CFKM%

return

CheckForKeyMouse:
    if not GetKeyState("Shift")
        return
    GetKeyState("Down") ? (d*=multiplier) : (d:=1)
    GetKeyState("Up") ? (u*=multiplier) : (u:=1)
    GetKeyState("Right") ? (r*=multiplier) : (r:=1)
    GetKeyState("Left") ? (l*=multiplier) : (l:=1)  
    y := (d-u) * distance
    x := (r-l) * distance
    MouseMove, x, y, , R
return