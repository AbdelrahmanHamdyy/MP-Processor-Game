include des1.inc
include ins1.inc
include ins2.inc
include utility.inc
include src1.inc
include srcval.inc
.model huge
;----------------EXECUTE INSTRUCTION---------------- 

executeInstruction macro input 
CheckDestination input+6
;CheckSourceVal input+9
CheckSource input+9
checkInsruction05  input+2
endm executeInstruction

;---------------------dataSegment------------------------

.data
instruction db 16,?, 16 dup('$') 
newline db 10,13,'$'  
               
;---------------------REGISTERS---------------------

AXREG LABEL WORD 
ALREG db 12H 
AHREG db 13H 
 
BXREG LABEL WORD 
BLREG db 18H 
BHREG db 44H 
 
CXREG LABEL WORD 
CLREG db 8h 
CHREG db 6h 
 
DXREG LABEL WORD 
DLREG db 1h 
DHREG db 34h

SIREG dw ? 
DIREG dw ? 
BPREG dw ?

;------------------INSTRUCTION STRINGS---------------

mov_str db "MOV$"
add_str db "ADD$"
adc_str db "ADC$"
sub_str db "SUB$"
sbb_str db "SBB$"
and_str db "AND$"
mul_str db "MUL$"
div_str db "DIV$"
xor_str db "XOR$"
nop_str db "NOP$" 
shr_str db "SHR$" 
shl_str db "SHL$" 
sar_str db "SAR$" 
clc_str db "CLC$" 
ror_str db "ROR$" 
rcl_str db "RCL$" 
rcr_str db "RCR$" 
rol_str db "ROL$" 
inc_str db "INC$" 
dec_str db "DEC$"

;-------------------REGISTER STRINGS-----------------

ax_str db "AX$" 
al_str db "AL$" 
ah_str db "AH$" 
 
bx_str db "BX$" 
bl_str db "BL$" 
bh_str db "BH$" 
 
cx_str db "CX$" 
cl_str db "CL$" 
ch_str db "CH$" 
 
dx_str db "DX$" 
dl_str db "DL$" 
dh_str db "DH$"

si_str db "SI$"
di_str db "DI$"
bp_str db "BP$"
               
;----------------------------------------------------
.code
    main proc far
        mov AX,@DATA
        mov DS,AX
        mov ES,AX
        MOV BX,1234H
        readmsg instruction
        executeInstruction instruction  
        printmsg newline
        mov dx,word ptr BLREG
        printhexa dx
         
main endp 
end main