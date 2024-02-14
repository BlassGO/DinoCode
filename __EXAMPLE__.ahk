﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include DinoCode.ahk
#include eval.ahk
#include active_script.ahk

; % must be escaped `% for AHK
; So reading from a file is more convenient
code=
(

# It can be considered a function
:Show_Result
    Message "HUH" With "Success rate: $(Round (1/(INCORRECT+1)*100) 2) `%"

# Main TAG that runs by default
:MAIN
   Global INCORRECT
   Set INCORRECT With 0
   If $(Question With "Do you want to continue?")
       Message "Olee" With "Welcome to DinoCode!"
       While True
           Set OPTION With $(Option "DinoCode--------" "What goes on four legs in the morning, two legs in the afternoon, and three legs in the evening?" With "A human being" "A dog" "A bird")
           If (OPTION=1)
              Break
           Else
              INCORRECT++
      show_result
   Else
       Abort
   Exit
)

; Exec
load_config(code)

; Clean
load_config(,,,,,true)

ExitApp