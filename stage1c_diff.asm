; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
                  push{r0,r1,r2}    ; push r0 r1 r2 into stack
                  bl stage1a_min    ; call function stage1a_min
                  mov r3, r0        ; receive min data

                  pop{r0,r1,r2}
                  push{r0,r1,r2}
                  bl stage1b_max    ; call function stage 1a
                  mov r4, r0        ; receive max data
                  pop{r0,r1,r2}

                  sub r5, r4, r3    ; r5 = r4 - r3
                  mov r0,r5         ; this is a place holder - replace "1" with the register holding the return value
                  bx lr             ; return

