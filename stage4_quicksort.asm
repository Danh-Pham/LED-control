; function stage4_quicksort
; sorts given array using the sorting algorithm quicksort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage4_quicksort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

        ; your function must mov the address of the sorted array to r0
         push{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,lr}
         mov r4,r1          ; R4 = Array Location
         mov r5,r0           ; R5 - Array Size
         cmp r5,#1           ; Check for an array of size <= 1
         cmp r5,#2           ; Check for an array of size == 2
         mov r11,4     ; number of bytes per value to jump to next

         pop{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,lr}
         mov r0,$FE000000   ;base
         adr r2,numarray2
         mov r1,8
         bl stage2_flash_array
         bx lr