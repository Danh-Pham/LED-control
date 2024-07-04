; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        ; implement your function here

        push{r0,r1,r2,r4,r5,r6,r7,r8}      ; remember to push any registers you use to the stack before you use them
        mov r4,r1   ; move array size to local register

        ; check if array is empty or not
        cmp r1,0
        beq skip$


                       mov r6,0     ; initialise current index
                       mov r7,4     ; number of bytes per value to jump to next
                       mov r12,#8   ; create loop 8 times
                       flash_location$:
                                mul r8,r6,r7          ;calculate byte offset  ( byteoffset =  curr_index * 4 bytes)
                                ldr r3,[r2,r8]        ; get current indexed value
                                mov r1,r3        ; value to flash
                                push{r2}        ; push r2 into stack
                                mov r2,$20000   ; delay time of ~1 second (ie 1 sec on , 1 sec off)
                                push{lr}   ; store current lr before it is overwritten during function call
                                bl FLASH   ; call the FLASH function
                                pop{lr}    ; restore old lr value
                                mov r1,$200000  ; 2 seconds delay
                                mov r0, BASE  ; pass BASE address for peripherals
                                push{lr}
                                bl PAUSE        ; pause for 2s
                                pop{lr}
                                pop{r2}         ; restore r2 value
                                add r6,#1       ; increment current index
                                sub r12,#1      ; use r12 to do the loop 8 times
                                cmp r12,0
                                bne flash_location$
        skip$:
        pop{r0,r1,r2,r4,r5,r6,r7,r8}       ; ( and pop them off at the very end)
        bx lr



