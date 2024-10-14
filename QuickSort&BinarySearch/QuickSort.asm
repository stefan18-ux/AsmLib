section .text
    global quick_sort

quick_sort:
    push ebp
    mov ebp, esp
    pusha

    ;scoatem argumentele 
    mov eax, [ebp + 8]
    ;scoatem argumentele 
    mov ebx, [ebp + 12]
    ;scoatem argumentele 
    mov edx, [ebp + 16]

    cmp ebx, edx 
    jge end

    ;pivot
    mov esi, dword [eax + 4 * edx] 
    mov edi, ebx 
    dec edi 

    mov ecx, ebx
for_loop:
    ;numarul
    cmp dword [eax + 4 * ecx], esi
    jl increm

continue: 
    inc ecx
    cmp ecx, edx
    jle for_loop

    dec ecx
    inc edi
    pusha
    ;facem swap
    mov ebx, dword [eax + 4 * ecx]
    ;facem swap
    mov esi, dword [eax + 4 * edi]
    ;facem swap
    mov dword [eax + 4 * ecx], esi
    ;facem swap
    mov dword [eax + 4 * edi], ebx
    popa

    ;apeluri recursive
    dec edi
    push edi
    push ebx
    push eax
    call quick_sort
    ;golim stiva
    add esp, 12

    ;adaugam 2
    add edi, 2
    push edx
    push edi
    push eax
    call quick_sort
    ;golim stiva
    add esp, 12

    jmp end

increm:
    inc edi
    pusha
    ;facem swap
    mov ebx, dword [eax + 4 * ecx]
    ;facem swap
    mov esi, dword [eax + 4 * edi]
    ;facem swap
    mov dword [eax + 4 * ecx], esi
    ;facem swap
    mov dword [eax + 4 * edi], ebx
    popa
    jmp continue

end:
    popa    
    leave
    ret

