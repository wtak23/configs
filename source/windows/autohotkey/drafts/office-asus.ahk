;**************************************************************************
; # : windows key
; ^ : control key
; ! : alt key
; + : shift key
;--------------------------------------------------------------------------
;           http://ahkscript.org/docs/KeyList.htm
;**************************************************************************
RunOrActivate(Target, WinTitle = "")
{
    ; Get the filename without a path
    SplitPath, Target, TargetNameOnly

    Process, Exist, %TargetNameOnly%
    If ErrorLevel > 0
        PID = %ErrorLevel%
    Else
        Run, %Target%, , , PID

    ; At least one app (Seapine TestTrack wouldn't always become the active
    ; window after using Run), so we always force a window activate.
    ; Activate by title if given, otherwise use PID.
    If WinTitle <> 
    {
        SetTitleMatchMode, 2
        WinWait, %WinTitle%, , 3
        TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)
        WinActivate, %WinTitle%
    }
    Else
    {
        WinWait, ahk_pid %PID%, , 3
        ; TrayTip, , Activating PID %PID% (%TargetNameOnly%) ; <- don't display message on trayicon
        WinActivate, ahk_pid %PID%
    }


    SetTimer, RunOrActivateTrayTipOff, 1500
}

; Turn off the tray tip
RunOrActivateTrayTipOff:
    SetTimer, RunOrActivateTrayTipOff, off
    TrayTip
Return
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
; win+alt+O -> onenote
#!o::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
^!o::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
^!1::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
; mbutton & o::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\ONENOTE.EXE")
;--------------------------------------------------------------------------

; ;--------------------------------------------------------------------------
; ; alt+win+e -> Excel (02/03/2015)
#!e::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
^!e::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
; MButton & e::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
; if GetKeyState("Shift","P")
; {
;     RunOrActivate("C:\Users\takanori\Dropbox\my-work-log.xlsx")
; }    
; else
;     RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE")
; Return
; ;--------------------------------------------------------------------------ff

; ;--------------------------------------------------------------------------
; ; alt+win+p -> Powerpoint (02/03/2015)
; ; alt+win+shift+p -> picpick (02/03/2015)
; ; picpick
#!p:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
^!p:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
^!2:: RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
#!+p:: RunOrActivate("C:\Program Files (x86)\PicPick\picpick.exe")
; MButton & p::
; if GetKeyState("Shift","P")
;     RunOrActivate("C:\Program Files (x86)\PicPick\picpick.exe")
; else
; {
;     RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE")
; }
; return

; ;--------------------------------------------------------------------------
; ; win+alt+z -> word
    #!z::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE")
    ^!w::RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE")
;     MButton & z::
;     RunOrActivate("C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE")
;     ; RunOrActivate("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft OneNote 2010")
;     return
; ;--------------------------------------------------------------------------