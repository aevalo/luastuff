; ----------------------------------------------------------------------------
; maxofthree.asm
;
; NASM implementation of a function that returns the maximum value of its
; three long long integer parameters.  The function has prototype:
;
;   long long int maxofthree(long long int x, long long int y, long long int z)
;
; Note that only rax, rcx, and rdx were used so no registers had to be saved
; and restored.
; ----------------------------------------------------------------------------   

global   maxofthree
global   get_vendor_id

section .text

maxofthree:
        push    ebp 
        mov     ebp,esp 
        sub     esp,0x40        ; 64 bytes of local stack space 
        mov     eax, [ebp+8]    ; first parameter to function 	
	mov   	ecx, [ebp+12]
	mov   	edx, [ebp+16]
	
	cmp     eax, ecx          ;if eax <  ecx
	cmovl   eax, ecx          ;   eax <- ecx
	cmp     eax, edx          ;if eax <  edx
	cmovl   eax, edx          ;   eax <- edx
	
        leave                   ; mov esp,ebp / pop ebp 
	ret


get_vendor_id:
    push    ebp
    mov     ebp,esp
    sub     esp,0x40        ; 64 bytes of local stack space
	
	mov	eax, 0
	cpuid
	
	mov	eax, [ebp+8]
	mov	[eax], ebx
	mov	[eax+4], edx
	mov	[eax+8], ecx
    mov ax, 0
    
    leave                   ; mov esp,ebp / pop ebp
    ret

