; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here


        push{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,lr}          ; remember to push any registers you use to the stack before you use them
        mov r4,r0   ; move array size to local register

        ; check if array is empty or not
        cmp r0,0
        beq skipbub$


                       bsort_begin:
                            mov r6,0     ; initialise current index
                            mov r7,4     ; number of bytes per value to jump to next
                            mov r11,#0   ;number of swaps

                       loopcompare$:
                                mul r8,r6,r7          ;calculate byte offset  ( byteoffset =  curr_index * 4 bytes)
                                ldr r3,[r1,r8]        ; get current indexed value

                                add r10,r6,#1         ;r10 keep data of the next index
                                cmp r10,r0            ; if the index > size of array
                                bge loopcheck$
                                mul r12,r10,r7         ;calculate byte offset
                                ldr r9,[r1,r12]       ; get the next index value
                                cmp r3,r9             ; compare the value in 2 index
                                strgt r3,[r1,r12]     ; if greater then swap
                                strgt r9,[r1,r8]
                                addgt r11,r11,#1       ; increase number of swap by 1
                                mov r6,r10             ; advance to the next element
                                b loopcompare$

                      loopcheck$:
                                cmp r11,#0            ; check if there any changes?
                                subgt r0,r0,#1
                                bgt bsort_begin        ; if changed, do it again.
                                mov r0,$FE000000 ; pass peripheral base address
                                adr r2,numarray1     ; array to flash
                                mov r1,8  ; size of arrays
                                bl stage2_flash_array      ; call function flash the array

        skipbub$:
        pop{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,pc}    ; ( and pop them off at the very end)
        bx lr      ; return


