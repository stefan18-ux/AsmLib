section .data
    value dd -1

section .text
    global binary_search
    extern printf

binary_search:
    push ebp 
    mov ebp, esp

    push ebx
    push ecx
    push edx
    push esi
    push edi

    ;low
    mov esi, [ebp + 8]
    ;high 
    mov edi, [ebp + 12]

    cmp esi, edi
    jg end0

    mov ebx, edi 
    sub ebx, esi
    ;impartim la doi
    shr ebx, 1
    add ebx, esi

    ;vedem daca am gasit rezultatul
    cmp dword [ecx + 4 * ebx], edx
    je end1

    ;vedem daca ne ducem in dreapta sau stanga
    cmp dword [ecx + 4 * ebx], edx
    jg greater

    inc ebx
    push edi
    push ebx
    call binary_search
    ;golim stiva
    add esp, 8

    jmp next

greater:
    dec ebx
    push ebx
    push esi
    call binary_search
    ;golim stiva
    add esp, 8

next:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret

end0:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ;rezultatul
    mov eax, -1
    leave
    ret

end1:
    pop edi
    pop esi
    pop edx
    pop ecx

    mov eax, ebx
    pop ebx
    leave
    ret

