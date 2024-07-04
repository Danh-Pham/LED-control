; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        ; implement your function here
         push{r0} ; push r0 to stack
         cmp r0,r1          ; compare if r0 <= r1
         bls Less$        ; goto Less if r0 <= r1
         mov r0,r1       ; if r0 > r1 =) then move r1 to r0 because r0 will hold the min value
         push{r0}
         cmp r0,r2       ; compare if r0 < r2
         bls EXITa$    ; goto EXIT if r0 is the min number
         mov r0,r2       ; if r2 > r0 =) r2 -> r0
         push{r0}
         b EXITa$          ; goto EXIT

        Less$:
        cmp r0,r2      ; compare if r0 < r2
        bls EXITa$       ; goto EXIT
        mov r0,r2      ; if r0 > r2 => then move r2 to r0
        push {r0}


        ; goto EXIT

        EXITa$:
        pop{r0}
        bx lr