.section .init
.global main

/* set stack pointer */
lui sp, %hi(2*1024)
addi sp, sp, %lo(2*1024)

/* call main */
jal ra, main

/* break */
ebreak
