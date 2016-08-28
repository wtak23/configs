;******************************************************************************;
; My hotstrings....turned out becoming my snippet/template repository
; (the somewhat awkard looking indentation is for code-folding in Sublime Text)
;******************************************************************************;

;==============================================================================;
; (10/22/2014)
; - decided to adopt the "copy-and-paste" approach to print out my hotstrings.
;   this avoids the key-delay and also avoids unintended triggering of hotkeys
;==============================================================================;
PasteString(String)
    {
        ;==========================================================================;
        ; ref: http://www.autohotkey.com/board/topic/98780-how-to-speed-up-hotstrings/
        ;==========================================================================;
        ; save clipboard contents
        OldClip := ClipboardAll
        ; Set clipboard
        Clipboard = %String%
        ; Wait for clipboard contents to update.
        ClipWait
        ; Send paste. ("^"=ctrl, "+"=shift)
        SendInput, ^V
        Sleep, 200 ; Give some time for the text to be pasted.
        ; Restore the clipboard
        Clipboard := OldClip
    }              


;******************************************************************************;
;                      Setup HotString Configuration                           ;
;******************************************************************************;
    ;==========================================================================;
    ; Configure triggering options
    ; - http://www.autohotkey.com/docs/commands/_Hotstring.htm
    ;--------------------------------------------------------------------------;
    ; Default: #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
    ;--------------------------------------------------------------------------;    
    ;==========================================================================;
    ; setup hot-strings to only fire on the "\" key (to avoid overlap with Sublime Text)
    #Hotstring EndChars `t


    ;==========================================================================;
    ; Configure global variables here
    ;------------------------------------------------------------------------------;
    ; http://superuser.com/questions/495587/how-can-i-define-a-variable-and-then-use-it-in-multiple-hotkeys
    ;==========================================================================;
    #Persistent 

    ;~~~~~~~~~~~~~~~~~~~~~
    ;Global Variables (all must be defined here...which stinks but oh well)
    ; (can't include a number in variable name...the documentation says you can, 
    ;  but this messes up the function call...sigh)
    ;~~~~~~~~~~~~~~~~~~~~~
    ; the letters at the end is entirely arbitrary
    global numRep_a:=78
    global numRep_aa:=76
    global numRep_b:=74
    global numRep_c:=71

    ;==========================================================================;
    ; "SetKeyDelay" must be setup so there will be no delay while looping over keystrokes
    ; http://www.autohotkey.com/docs/commands/SetKeyDelay.htm
    ;==========================================================================;
    SetKeyDelay, -1

    ;==========================================================================;
    ; Toggle AHK on and off using "numlock" key
    ;==========================================================================;
    $numlock::
    ; Pause
    Suspend
    return

    ;==========================================================================;
    ; Some other helpful links (lines are tabbed for Sublime Text to recognize code folds
    ;==========================================================================;
        ; http://ahkscript.org/docs/Hotstrings.htm
        ;----------------------------------------------------------------------;
        ; http://www.autohotkey.com/docs/commands/Loop.
        ;   "+" <- enclose by {+}
        ;   "#" <- enclose by {#}
        ;   `% <- enclose by `%
        ;----------------------------------------------------------------------;
        ; http://ahkscript.org/docs/Hotstrings.htm
        ; http://www.autohotkey.com/docs/commands/_EscapeChar.htm
        ;   - list of special escape characters, such as `%, `t, `r
        ;----------------------------------------------------------------------;
        ; Options: Putting options inside a hotstring's first pair of colons
        ; - * (asterisk): an ending character (e.g. space, period, or enter) is not 
        ;                 required to trigger the hotstring. 
        ; - C: Case sensitive
        ;----------------------------------------------------------------------;
        ; http://ahkscript.org/docs/commands/Send.htm
        ; - Sends simulated keystrokes and mouse clicks to the active window.    
        ;----------------------------------------------------------------------;

;******************************************************************************;
;          Some text abbreviations I frequently use and want to expand
;******************************************************************************;
    ; javascript
    ::#js::
        String=JavaScript
        PasteString(String)
        return

    ; sublime-text
    ::#st::
        String=Sublime Text
        PasteString(String)
        return

    ; Stack Overflow
    ::#so::
        String=Stack Overflow
        PasteString(String)
        return

    ; my name
    ::#tak::
        String=Takanori Watanabe
        PasteString(String)
        return

    ; my email address
    ::#gmail::
        String=takwatanabe2004@gmail.com
        PasteString(String)
        return

    ; regexp (make these case sensitive, so use the "C" option in hotstrings)
    :C:#regex::
        String=regular expression
        PasteString(String)
        return
    :C:#Regex::
        String=Regular expression
        PasteString(String)
        return      

;******************************************************************************;
;                              Time stampers
;------------------------------------------------------------------------------;
; - Ref: http://www.autohotkey.com/docs/commands/FormatTime.htm]
; - below, TimeString is a variable name, so you're free to change it
;******************************************************************************;
    ; the standard one I use most frequently
    ; Example output: 03/01/2013
    ::#t::
        FormatTime, TimeString,, MM/dd/yyyy
        PasteString(TimeString)
        return

    ; "m" for "minutes"
    ; Example Output: 03/01/2013 11:57
    ::#tm::
        FormatTime, TimeString,, MM/dd/yyyy h:mm:tt
        PasteString(TimeString)
        Return

    ; Include all info (Day of the week too)
    ; Example-output: ***** Friday, March 01, 2013 11:47 PM *****
    ::#tfull::
        FormatTime, TimeString, R
        String=***** %TimeString% *****
        PasteString(String)
        Return

    ; Example output: ***** 03/01/2013 11:57 PM *****
    ::#t*::
        FormatTime, TimeString,, MM/dd/yyyy h:mm tt 
        String=***** %TimeString% *****
        PasteString(String)
        Return

    ; Include all info (Day of the wee
    ; Example-output: ***** Friday, March 01, 2013 11:47 PM *****
    ; ::#t*full::
    ; FormatTime, TimeString, R
    ; SendInput,  ***** %TimeString% *****
    ; Return

    ; When I download stuff...timestamp it with message
    ::#td::
        FormatTime, TimeString,, MM/dd/yyyy
        String=(Downloaded on %TimeString%)%A_Space%
        PasteString(String)
        Return

    ; Concise version
    ;; I had trouble figuring out how to include space...see "Built-in-variables":
    ;; http://www.autohotkey.com/docs/Variables.htm
    ::#tdd::
        FormatTime, TimeString,, MM/dd/yyyy
        String=(dloaded %TimeString%)%A_Space%
        PasteString(String)
        Return


    ;==============================================================================;
    ; (10/16/2014)
    ; - time-stampers for file (cuz backslash won't work here)
    ;==============================================================================;
    ::#tf:: ; (f for "file"....not great but an ok mneumonic)
        FormatTime, TimeString,, yyyy-MM-dd-
        PasteString(TimeString)
        Return

;******************************************************************************;
;                               Code Dasher        
;------------------------------------------------------------------------------;
; Trigger "code-dasher" 
; - prefix trigger key with "$" symbol
;------------------------------------------------------------------------------;
; See here for a list of comment styles
;   - http://en.wikipedia.org/wiki/Comment_(computer_programming)#Examples
;   - http://en.wikipedia.org/wiki/                  ;
;******************************************************************************;
    ;--------------------------------------------------------------------------;
    ; HTML (Enclose ! in {!}, as this is a special character for the "Alt"-key in AHK
    ;        "<!-- CODE BLOCK -->"
    ;--------------------------------------------------------------------------;
    HTML_DASH(Key, n_rep)
        {
            SendInput <{!}-- {%Key% %n_rep%} -->
        }    
        ; level 0 indentation
        ::$<-::
            HTML_DASH("-",numRep_c)
            return
        ::$<=::
            HTML_DASH("=",numRep_c)
            return
        ::$<*::
            HTML_DASH("*",numRep_c)
            return

        ; level 1 indentation (4 less space)
        ::$<--::
            HTML_DASH("-",numRep_c-4)
            return

        ::$<==::
            HTML_DASH("=",numRep_c-4)
            return

        ::$<**::
            HTML_DASH("*",numRep_c-4)
            return

        ; level 2 indentation (4*2 less space)
        ::$<---::
            HTML_DASH("-",numRep_c-8)
            return

        ::$<===::
            HTML_DASH("=",numRep_c-8)
            return

        ::$<***::
            HTML_DASH("*",numRep_c-8)
            return

        ; level 3 indentation (4*3 less space)
        ::$<----::
            HTML_DASH("-",numRep_c-12)
            return

        ::$<====::
            HTML_DASH("=",numRep_c-12)
            return

        ::$<****::
            HTML_DASH("*",numRep_c-12)
            return    

    ;--------------------------------------------------------------------------;
    ; rst
    ;       ".. CODE BLOCK .."
    ;--------------------------------------------------------------------------;
    RST_DASH(Key, n_rep)
        {
            SendInput .. {%Key% %n_rep%} ..
        }
        ; level 0 indentation
        ::$..-::
            RST_DASH("-",numRep_b)
            return
        ::$..=::
            RST_DASH("=",numRep_b)
            return
        ::$..*::
            RST_DASH("*",numRep_b)
            return
        ; level 1 indentation        
        ::$..--::
            RST_DASH("-",numRep_b-4)
            return
        ::$..==::
            RST_DASH("=",numRep_b-4)
            return
        ::$..**::
            RST_DASH("*",numRep_b-4)
            return      

        ; level 2 indentation        
        ::$..---::
            RST_DASH("-",numRep_b-8)
            return
        ::$..===::
            RST_DASH("=",numRep_b-8)
            return
        ::$..***::
            RST_DASH("*",numRep_b-8)
            return             

        ; level 3 indentation        
        ::$..----::
            RST_DASH("-",numRep_b-12)
            return
        ::$..====::
            RST_DASH("=",numRep_b-12)
            return
        ::$..****::
            RST_DASH("*",numRep_b-12)
            return  
    ;--------------------------------------------------------------------------;
    ; CSS, C, C++, C#, JAVA, JAVASCRIPT, PHP, ETC...
    ;        "/* CODE BLOCK /*"
    ;--------------------------------------------------------------------------;
    CSS_DASH(Key, n_rep)
        {
            SendInput /* {%Key% %n_rep%} */
        }    
        ; level 0 indentation
        ::$*-::
            CSS_DASH("-",numRep_b)
            return
        ::$*=::
            CSS_DASH("=",numRep_b)
            return
        ::$**::
            CSS_DASH("*",numRep_b)
            return

        ; level 1 indentation (4 less space)
        ::$*--::
            CSS_DASH("-",numRep_b-4)
            return

        ::$*==::
            CSS_DASH("=",numRep_b-4)
            return

        ::$***::
            CSS_DASH("*",numRep_b-4)
            return

        ; level 2 indentation (4*2 less space)
        ::$*---::
            CSS_DASH("-",numRep_b-8)
            return

        ::$*===::
            CSS_DASH("=",numRep_b-8)
            return

        ::$****::
            CSS_DASH("*",numRep_b-8)
            return

        ; level 3 indentation (4*3 less space)
        ::$*----::
            CSS_DASH("-",numRep_b-12)
            return

        ::$*====::
            CSS_DASH("=",numRep_b-12)
            return

        ::$*****::
            CSS_DASH("*",numRep_b-12)
            return        

    ;--------------------------------------------------------------------------;
    ; Lisp, closure, Common, etc wrapper
    ;       "; CODE BLOCK ;"
    ;--------------------------------------------------------------------------;
    LISP_DASH(Key, n_rep)
        {
            SendInput `;{%Key% %n_rep%}`;
        }
        ; level 0 indentation
        ::$;-::
            LISP_DASH("-",numRep_a)
            return
        ::$;=::
            LISP_DASH("=",numRep_a)
            return
        ::$;*::
            LISP_DASH("*",numRep_a)
            return
        ; level 1 indentation        
        ::$;--::
            LISP_DASH("-",numRep_a-4)
            return
        ::$;==::
            LISP_DASH("=",numRep_a-4)
            return
        ::$;**::
            LISP_DASH("*",numRep_a-4)
            return      

        ; level 2 indentation        
        ::$;---::
            LISP_DASH("-",numRep_a-8)
            return
        ::$;===::
            LISP_DASH("=",numRep_a-8)
            return
        ::$;***::
            LISP_DASH("*",numRep_a-8)
            return   
      
        ; level 3 indentation        
        ::$;----::
            LISP_DASH("-",numRep_a-12)
            return
        ::$;====::
            LISP_DASH("=",numRep_a-12)
            return
        ::$;****::
            LISP_DASH("*",numRep_a-12)
            return  
    ;--------------------------------------------------------------------------;
    ; Matlab, LatexT, Prolog, {10] Erlang, S-Lang, Visual Prolog
    ;       "% CODE BLOCK %"
    ;--------------------------------------------------------------------------;
    TEX_DASH(Key, n_rep)
        {
            SendInput `%{%Key% %n_rep%}`%
        }
        ; level 0 indentation
        ::$%-::
            TEX_DASH("-",numRep_a)
            return
        ::$%=::
            TEX_DASH("=",numRep_a)
            return
        ::$%*::
            TEX_DASH("*",numRep_a)
            return
        ; level 1 indentation        
        ::$%--::
            TEX_DASH("-",numRep_a-4)
            return
        ::$%==::
            TEX_DASH("=",numRep_a-4)
            return
        ::$%**::
            TEX_DASH("*",numRep_a-4)
            return      

        ; level 2 indentation        
        ::$%---::
            TEX_DASH("-",numRep_a-8)
            return
        ::$%===::
            TEX_DASH("=",numRep_a-8)
            return
        ::$%***::
            TEX_DASH("*",numRep_a-8)
            return   

        ; level 3 indentation        
        ::$%---::
            TEX_DASH("-",numRep_a-12)
            return
        ::$%===::
            TEX_DASH("=",numRep_a-12)
            return
        ::$%***::
            TEX_DASH("*",numRep_a-12)
            return          

    ;--------------------------------------------------------------------------;
    ; Java, JavaScript, C++, C#, PHP, Objective-C, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    JAVA_DASH(Key, n_rep)
        {
            SendInput //{%Key% %n_rep%}//
        }
        ; level 0 indentation
        ::$/-::
            JAVA_DASH("-",numRep_aa)
            return
        ::$/=::
            JAVA_DASH("=",numRep_aa)
            return
        ::$/*::
            JAVA_DASH("*",numRep_aa)
            return

        ; level 1 indentation        
        ::$/--::
            JAVA_DASH("-",numRep_aa-4)
            return
        ::$/==::
            JAVA_DASH("=",numRep_aa-4)
            return
        ::$/**::
            JAVA_DASH("*",numRep_aa-4)
            return      

        ; level 2 indentation        
        ::$/---::
            JAVA_DASH("-",numRep_aa-8)
            return
        ::$/===::
            JAVA_DASH("=",numRep_aa-8)
            return
        ::$/***::
            JAVA_DASH("*",numRep_aa-8)
            return   

        ; level 3 indentation        
        ::$/---::
            JAVA_DASH("-",numRep_aa-12)
            return
        ::$/===::
            JAVA_DASH("=",numRep_aa-12)
            return
        ::$/***::
            JAVA_DASH("*",numRep_aa-12)
            return        

    ;--------------------------------------------------------------------------;
    ; Bash, Perl, Python, Ruby, PHP, R, Maple, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    BASH_DASH(Key, n_rep)
        {
            SendInput {#}{%Key% %n_rep%}{#}
        }
        ; level 0 indentation
        ::$#-::
            BASH_DASH("-",numRep_a)
            return
        ::$#=::
            BASH_DASH("=",numRep_a)
            return
        ::$#*::
            BASH_DASH("*",numRep_a)
            return
        ; level 1 indentation        
        ::$#--::
            BASH_DASH("-",numRep_a-4)
            return
        ::$#==::
            BASH_DASH("=",numRep_a-4)
            return
        ::$#**::
            BASH_DASH("*",numRep_a-4)
            return      

        ; level 2 indentation        
        ::$#---::
            BASH_DASH("-",numRep_a-8)
            return
        ::$#===::
            BASH_DASH("=",numRep_a-8)
            return
        ::$#***::
            BASH_DASH("*",numRep_a-8)
            return   

        ; level 3 indentation        
        ::$#---::
            BASH_DASH("-",numRep_a-12)
            return
        ::$#===::
            BASH_DASH("=",numRep_a-12)
            return
        ::$#***::
            BASH_DASH("*",numRep_a-12)
            return    

    ;--------------------------------------------------------------------------;
    ; SQL, Ada, AppleScript, Eiffel, Lua, VHDL, SGML, etc
    ;       "-- CODE BLOCK "
    ;--------------------------------------------------------------------------;
    SQL_DASH(Key, n_rep)
        {
            SendInput --{%Key% %n_rep%}--
        }
        ; level 0 indentation
        ::$--::
            SQL_DASH("-",numRep_aa)
            return
        ::$-=::
            SQL_DASH("=",numRep_aa)
            return
        ::$-*::
            SQL_DASH("*",numRep_aa)
            return

        ; level 1 indentation        
        ::$---::
            SQL_DASH("-",numRep_aa-4)
            return
        ::$-==::
            SQL_DASH("=",numRep_aa-4)
            return
        ::$-**::
            SQL_DASH("*",numRep_aa-4)
            return      

        ; level 2 indentation        
        ::$----::
            SQL_DASH("-",numRep_aa-8)
            return
        ::$-===::
            SQL_DASH("=",numRep_aa-8)
            return
        ::$-***::
            SQL_DASH("*",numRep_aa-8)
            return   

        ; level 3 indentation        
        ::$----::
            SQL_DASH("-",numRep_aa-12)
            return
        ::$-===::
            SQL_DASH("=",numRep_aa-12)
            return
        ::$-***::
            SQL_DASH("*",numRep_aa-12)
            return        

;******************************************************************************;
;                               Code wrappper        
;------------------------------------------------------------------------------;
; Trigger "code-wrapping" (
; - no prefixing in the trigger-key...
;------------------------------------------------------------------------------;
; See here for a list of comment styles
;   - http://en.wikipedia.org/wiki/Comment_(computer_programming)#Examples
;   - http://en.wikipedia.org/wiki/                  ;
;******************************************************************************;

    ;--------------------------------------------------------------------------;
    ; HTML (Enclose ! in {!}, as this is a special character for the "Alt"-key in AHK
    ;        "<!-- CODE BLOCK -->"
    ;--------------------------------------------------------------------------;
    HTML_WRAP(Key, n_rep)
        {
            SendInput <{!}-- {%Key% %n_rep%} -->`r
            SendInput <{!}--  -->`r
            SendInput <{!}-- {%Key% %n_rep%} -->
            SendInput {Up}{Left 4}
        }    
        ; level 0 indentation
        ::<-::
            HTML_WRAP("-",numRep_c)
            return
        ::<=::
            HTML_WRAP("=",numRep_c)
            return
        ::<*::
            HTML_WRAP("*",numRep_c)
            return

        ; level 1 indentation (4 less space)
        ::<--::
            HTML_WRAP("-",numRep_c-4)
            return

        ::<==::
            HTML_WRAP("=",numRep_c-4)
            return

        ::<**::
            HTML_WRAP("*",numRep_c-4)
            return

        ; level 2 indentation (4*2 less space)
        ::<---::
            HTML_WRAP("-",numRep_c-8)
            return

        ::<===::
            HTML_WRAP("=",numRep_c-8)
            return

        ::<***::
            HTML_WRAP("*",numRep_c-8)
            return

        ; level 3 indentation (4*3 less space)
        ::<----::
            HTML_WRAP("-",numRep_c-12)
            return

        ::<====::
            HTML_WRAP("=",numRep_c-12)
            return

        ::<****::
            HTML_WRAP("*",numRep_c-12)
            return        

    ;--------------------------------------------------------------------------;
    ; rst
    ;       ".. CODE BLOCK .."
    ;--------------------------------------------------------------------------;
    RST_WRAP(Key, n_rep)
        {
            SendInput .. {%Key% %n_rep%} ..`r
            SendInput ..  ..`r
            SendInput .. {%Key% %n_rep%} ..
            SendInput {Up}{Left 4}
        }
        ; level 0 indentation
        ::..-::
            RST_WRAP("-",numRep_b)
            return
        ::..=::
            RST_WRAP("=",numRep_b)
            return
        ::..*::
            RST_WRAP("*",numRep_b)
            return
        ; level 1 indentation        
        ::..--::
            RST_WRAP("-",numRep_b-4)
            return
        ::..==::
            RST_WRAP("=",numRep_b-4)
            return
        ::..**::
            RST_WRAP("*",numRep_b-4)
            return      

        ; level 2 indentation        
        ::..---::
            RST_WRAP("-",numRep_b-8)
            return
        ::..===::
            RST_WRAP("=",numRep_b-8)
            return
        ::..***::
            RST_WRAP("*",numRep_b-8)
            return             

        ; level 3 indentation        
        ::..----::
            RST_WRAP("-",numRep_b-12)
            return
        ::..====::
            RST_WRAP("=",numRep_b-12)
            return
        ::..****::
            RST_WRAP("*",numRep_b-12)
            return     
    ;--------------------------------------------------------------------------;
    ; CSS, C, C++, C#, JAVA, JAVASCRIPT, PHP, ETC...
    ;        "/* CODE BLOCK /*"
    ;--------------------------------------------------------------------------;
    CSS_WRAP(Key, n_rep)
        {
            SendInput /* {%Key% %n_rep%} */`r
            SendInput /*  */`r
            SendInput /* {%Key% %n_rep%} */
            SendInput {Up}{Left 4}
        }    
        ; level 0 indentation
        ::*-::
            CSS_WRAP("-",numRep_b)
            return
        ::*=::
            CSS_WRAP("=",numRep_b)
            return
        ::**::
            CSS_WRAP("*",numRep_b)
            return

        ; level 1 indentation (4 less space)
        ::*--::
            CSS_WRAP("-",numRep_b-4)
            return

        ::*==::
            CSS_WRAP("=",numRep_b-4)
            return

        ::***::
            CSS_WRAP("*",numRep_b-4)
            return

        ; level 2 indentation (4*2 less space)
        ::*---::
            CSS_WRAP("-",numRep_b-8)
            return

        ::*===::
            CSS_WRAP("=",numRep_b-8)
            return

        ::****::
            CSS_WRAP("*",numRep_b-8)
            return

        ; level 3 indentation (4*3 less space)
        ::*----::
            CSS_WRAP("-",numRep_b-12)
            return

        ::*====::
            CSS_WRAP("=",numRep_b-12)
            return

        ::*****::
            CSS_WRAP("*",numRep_b-12)
            return        

    ;--------------------------------------------------------------------------;
    ; Lisp, closure, Common, etc wrapper
    ;       "; CODE BLOCK ;"
    ;--------------------------------------------------------------------------;
    LISP_WRAP(Key, n_rep)
        {
            SendInput `;{%Key% %n_rep%}`;`r
            SendInput `; `r
            SendInput `;{%Key% %n_rep%}`;
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::;-::
            LISP_WRAP("-",numRep_a)
            return
        ::;=::
            LISP_WRAP("=",numRep_a)
            return
        ::;*::
            LISP_WRAP("*",numRep_a)
            return
        ; level 1 indentation        
        ::;--::
            LISP_WRAP("-",numRep_a-4)
            return
        ::;==::
            LISP_WRAP("=",numRep_a-4)
            return
        ::;**::
            LISP_WRAP("*",numRep_a-4)
            return      

        ; level 2 indentation        
        ::;---::
            LISP_WRAP("-",numRep_a-8)
            return
        ::;===::
            LISP_WRAP("=",numRep_a-8)
            return
        ::;***::
            LISP_WRAP("*",numRep_a-8)
            return   
      
        ; level 3 indentation        
        ::;----::
            LISP_WRAP("-",numRep_a-12)
            return
        ::;====::
            LISP_WRAP("=",numRep_a-12)
            return
        ::;****::
            LISP_WRAP("*",numRep_a-12)
            return         
    ;--------------------------------------------------------------------------;
    ; Matlab, LatexT, Prolog, {10] Erlang, S-Lang, Visual Prolog
    ;       "% CODE BLOCK %"
    ;--------------------------------------------------------------------------;
    TEX_WRAP(Key, n_rep)
        {
            SendInput `%{%Key% %n_rep%}`%`r
            SendInput `% `r
            SendInput `%{%Key% %n_rep%}`%
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::%-::
            TEX_WRAP("-",numRep_a)
            return
        ::%=::
            TEX_WRAP("=",numRep_a)
            return
        ::%*::
            TEX_WRAP("*",numRep_a)
            return
        ; level 1 indentation        
        ::%--::
            TEX_WRAP("-",numRep_a-4)
            return
        ::%==::
            TEX_WRAP("=",numRep_a-4)
            return
        ::%**::
            TEX_WRAP("*",numRep_a-4)
            return      

        ; level 2 indentation        
        ::%---::
            TEX_WRAP("-",numRep_a-8)
            return
        ::%===::
            TEX_WRAP("=",numRep_a-8)
            return
        ::%***::
            TEX_WRAP("*",numRep_a-8)
            return   

        ; level 3 indentation        
        ::%---::
            TEX_WRAP("-",numRep_a-12)
            return
        ::%===::
            TEX_WRAP("=",numRep_a-12)
            return
        ::%***::
            TEX_WRAP("*",numRep_a-12)
            return          

    ;--------------------------------------------------------------------------;
    ; Java, JavaScript, C++, C#, PHP, Objective-C, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    Java_WRAP(Key, n_rep)
        {
            SendInput //{%Key% %n_rep%}//`r
            SendInput //  `r
            SendInput //{%Key% %n_rep%}//
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::/-::
            Java_WRAP("-",numRep_aa)
            return
        ::/=::
            Java_WRAP("=",numRep_aa)
            return
        ::/*::
            Java_WRAP("*",numRep_aa)
            return

        ; level 1 indentation        
        ::/--::
            Java_WRAP("-",numRep_aa-4)
            return
        ::/==::
            Java_WRAP("=",numRep_aa-4)
            return
        ::/**::
            Java_WRAP("*",numRep_aa-4)
            return      

        ; level 2 indentation        
        ::/---::
            Java_WRAP("-",numRep_aa-8)
            return
        ::/===::
            Java_WRAP("=",numRep_aa-8)
            return
        ::/***::
            Java_WRAP("*",numRep_aa-8)
            return   

        ; level 3 indentation        
        ::/---::
            Java_WRAP("-",numRep_aa-12)
            return
        ::/===::
            Java_WRAP("=",numRep_aa-12)
            return
        ::/***::
            Java_WRAP("*",numRep_aa-12)
            return        

    ;--------------------------------------------------------------------------;
    ; Bash, Perl, Python, Ruby, PHP, R, Maple, etc
    ;       "// CODE BLOCK //"
    ;--------------------------------------------------------------------------;
    BASH_WRAP(Key, n_rep)
        {
            SendInput {#}{%Key% %n_rep%}{#}`r
            SendInput {#} `r
            SendInput `{#}{%Key% %n_rep%}{#}
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::#-::
            BASH_WRAP("-",numRep_a)
            return
        ::#=::
            BASH_WRAP("=",numRep_a)
            return
        ::#*::
            BASH_WRAP("*",numRep_a)
            return
        ; level 1 indentation        
        ::#--::
            BASH_WRAP("-",numRep_a-4)
            return
        ::#==::
            BASH_WRAP("=",numRep_a-4)
            return
        ::#**::
            BASH_WRAP("*",numRep_a-4)
            return      

        ; level 2 indentation        
        ::#---::
            BASH_WRAP("-",numRep_a-8)
            return
        ::#===::
            BASH_WRAP("=",numRep_a-8)
            return
        ::#***::
            BASH_WRAP("*",numRep_a-8)
            return   

        ; level 3 indentation        
        ::#---::
            BASH_WRAP("-",numRep_a-12)
            return
        ::#===::
            BASH_WRAP("=",numRep_a-12)
            return
        ::#***::
            BASH_WRAP("*",numRep_a-12)
            return    

    ;--------------------------------------------------------------------------;
    ; SQL, Ada, AppleScript, Eiffel, Lua, VHDL, SGML, etc
    ;       "-- CODE BLOCK "
    ;--------------------------------------------------------------------------;
    SQL_WRAP(Key, n_rep)
        {
            SendInput --{%Key% %n_rep%}--`r
            SendInput -- `r
            SendInput --{%Key% %n_rep%}--
            SendInput {Up}{Left 1}
        }
        ; level 0 indentation
        ::--::
            SQL_WRAP("-",numRep_aa)
            return
        ::-=::
            SQL_WRAP("=",numRep_aa)
            return
        ::-*::
            SQL_WRAP("*",numRep_aa)
            return

        ; level 1 indentation        
        ::---::
            SQL_WRAP("-",numRep_aa-4)
            return
        ::-==::
            SQL_WRAP("=",numRep_aa-4)
            return
        ::-**::
            SQL_WRAP("*",numRep_aa-4)
            return      

        ; level 2 indentation        
        ::----::
            SQL_WRAP("-",numRep_aa-8)
            return
        ::-===::
            SQL_WRAP("=",numRep_aa-8)
            return
        ::-***::
            SQL_WRAP("*",numRep_aa-8)
            return   

        ; level 3 indentation        
        ::----::
            SQL_WRAP("-",numRep_aa-12)
            return
        ::-===::
            SQL_WRAP("=",numRep_aa-12)
            return
        ::-***::
            SQL_WRAP("*",numRep_aa-12)
            return        



;==========================================================================;
; (10/16/2014) - block comments in "inline" form
;==========================================================================;
    ; html
    ::$<::
        String=<!--  -->
        PasteString(String)
        Send {Home}{Right 5}        
        return

    ; css, etc
    ::$/::
        String=/*  */
        PasteString(String)
        Send {Home}{Right 3}        
        return        

;******************************************************************************;
; webdev stuffs 
;******************************************************************************;
    ; jquery snippet
        ; ::$jq::
        ;     SendInput {Raw}`$(document).ready(function(){`
        ;     SendInput `r`t`r{Backspace 1}
        ;     SendInput {Raw}`});`
        ;     SendInput {Up}
        ;     return
    ::$jq::
        String=
        (
$(document).ready(function(){

});
        )
        PasteString(String)
        SendInput {Up}{Tab}
    return

    ; linkcss
    ::$linkcss::
        String=<link rel="stylesheet" type="text/css" href=".css" />
        PasteString(String)
        SendInput {Left 8}
        return

    ; jquery-cdn i typically insert
    ::$jqcdn::
        String=<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        PasteString(String)
        return

    ; jqueryui-cdn
    ::$jquicdn::
        String=<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
        PasteString(String)
        return

    ; mathjax
    ::$mathcdn::
        String=
        (
<script type="text/x-mathjax-config">  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$']], displayMath:[["$$","$$"]]  }});</script>
<script type="text/x-mathjax-config">  MathJax.Hub.Config({  TeX: { equationNumbers: { autoNumber: "AMS" } }});</script>
<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
        )
        PasteString(String)
        return
        
;******************************************************************************;
;                        rst templates
;******************************************************************************;

    ;==========================================================================;
    ; rst starter template
    ;--------------------------------------------------------------------------;
    ; Note
    ; - backspace `b needed to undo the indentation for the next line (ahk has some weird patterns i loathe)
    ; - See this for special  escape chars: http://www.autohotkey.com/docs/commands/_EscapeChar.htm
    ;==========================================================================;
    ::#rstinit::
        SendInput {Raw}``[Parent Directory] <./>``_`
        SendInput `r`r
        SendInput {Raw}`.. contents:: **Table of Contents**`
        SendInput `r    :depth: 2`r`r`b
        SendInput .. sectnum::`r
        SendInput {Raw} `   :start: 1`
        SendInput `r
        return
            
;     ::#rstinit::
;         String=
;         (
; `[Parent Directory] <./>`_

; .. contents:: **Table of Contents**
;     :depth: 2

; .. sectnum::
;     :start: 1
;         )
;         PasteString(String)
;         return

    ;==========================================================================;
    ; for rst headers
    ;==========================================================================;
    ;--------------------------------------------------------------------------;
        ; parts
        ::$#::
            String=####################
            PasteString(String)
            return

        ; chapters
        ::$*::
            String=********************
            PasteString(String)
            return

        ; sections
        ::$=::
            String=====================
            PasteString(String)
            return    

        ; subsections
        ::$-::
            String=--------------------
            PasteString(String)
            return      

        ; subsubsections
        ::$^::
            String=^^^^^^^^^^^^^^^^^^^^
            PasteString(String)
            return      

        ; paragraphs
        ::$"::
            String="""""""""""""""""""
            PasteString(String)
            return              
        ; parts
        ::$h1::
            String=
            (
####################
H1-NAME
####################
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return

        ; chapters
        ::$h2::
            String=
            (
********************
H2-NAME
********************
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return

        ; sections
        ::$h3::
            String=
            (
H3-NAME
====================
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return

        ; subsections
        ::$h4::
            String=
            (
H4-NAME
--------------------
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return   

        ; subsubsections
        ::$h5::
            String=
            (
H5-NAME
^^^^^^^^^^^^^^^^^^^^
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return    

        ; paragraphs
        ::$h6::
            String=
            (
H5-NAME
""""""""""""""""""""
            )
            PasteString(String)
            SendInput {Home}{Up}        
            return   

;******************************************************************************;
;                 matlab templates (with time-stamps)
;******************************************************************************;
    ;; initializer for matlab script
    ::#m::
        FormatTime, TimeString,, MM/dd/yyyy
        String=
        (
`%`% mfileName
`% %TimeString%
`%=========================================================================`%
`% - Comments
`%=========================================================================`%
`%`%
clear all;
purge

rootdir = fileparts(mfilename('fullpath'));

        )
        PasteString(String)
        Return

    ;; initializer for matlab function
    ::#mf::
        FormatTime, TimeString,, MM/dd/yyyy
        String=
        (
function tak_function
`% tak_function
`%=========================================================================`%
`% - Comments
`%=========================================================================`%
`% %TimeString%
`%`%
        )
        PasteString(String)
        Return


;******************************************************************************;
;                 Old unpolished junks for temporary purposes
;******************************************************************************;
    ;begin{

    ;end}
    ;********** My Hotkeys for temporary conveninece ***************
    ;; for adding new code in my git-repos study_toolboxes
    ;; Added 03/03/2013
    ;; "ctemp" for CodeTEMPlate
    ::#ctemp::
    SendInput, %A_Tab%- Title:`n- Paper:`n- url:`n- original dirname:`n- Description:`n %A_Tab%*%A_Space%`n
    Return

    ;; {
