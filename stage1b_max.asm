; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
        ; implement your function here
         push{r0}  ; remember to push any registers you use to the stack before you use them
         cmp r0,r1          ; compare if r0 >= r1
         bhs More$        ; goto Stage 1
         mov r0,r1       ; if r0 < r1 =) then move r1 to r0 because r0 will hold the max number
         push {r0}       ; push r0 to stack
         cmp r0,r2       ; compare if r0 > r2
         bhs EXITb$     ; goto EXITb if r0 is already a max number
         mov r0,r2       ; if r2 < r0 =) r2 -> r0
         push {r0}       ; push r0 to stack
         b EXITb$          ; goto EXIT

        More$:
        cmp r0,r2      ; compare if r0 > r2
        bhs EXITb$       ; goto EXIT
        mov r0,r2      ; if r0 < r2 => then move r2 to r0
        push {r0}      ; push r0 to stack


        EXITb$:
        pop{r0}
        bx lr
