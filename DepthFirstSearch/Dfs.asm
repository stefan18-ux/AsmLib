%include "../io.mac"

; The `expand` function returns an address to the following type of data
; structure.
struc neighbours_t
    .num_neighs resd 1  ; The number of neighbours returned.
    .neighs resd 1      ; Address of the vector containing the `num_neighs` neighbours.
                        ; A neighbour is represented by an unsigned int (dword).
endstruc

section .bss
; Vector for keeping track of visited nodes.
visited resd 10000
global visited

section .data
; Format string for printf.
fmt_str db "%u", 10, 0

section .text
global dfs
extern printf

; C function signiture:
;   void dfs(uint32_t node, neighbours_t *(*expand)(uint32_t node))
; where:
; - node -> the id of the source node for dfs.
; - expand -> pointer to a function that takes a node id and returns a structure
; populated with the neighbours of the node (see struc neighbours_t above).
; 
; note: uint32_t is an unsigned int, stored on 4 bytes (dword).
dfs:
    push ebp
    mov ebp, esp
    pusha
    ; TODO: Implement the depth first search algorith, using the `expand`
    ; function to get the neighbours. When a node is visited, print it by
    ; calling `printf` with the format string in section .data.
    ;argumentele de pe stiva
    mov eax, [ebp + 8]
    ;argumentele de pe stiva
    mov esi, [ebp + 12]
    ;marcam ca vizitat
    mov dword [visited + 4 * eax], 1

    pusha
    push eax
    push fmt_str
    call printf
    ;golim stiva
    add esp, 8
    popa

    push eax
    call esi
    ;golim stiva
    add esp, 4

    mov edx, dword [eax + neighbours_t.num_neighs]
    mov ebx, dword [eax + neighbours_t.neighs]

    xor ecx, ecx
find_neigh:
    cmp ecx, edx
    jz continue

    ;luam nodul
    mov edi, dword [ebx + 4 * ecx]
    ;vedem daca e vizitat nodul
    cmp dword [visited + 4 * edi], 1
    je next

    push esi
    push edi
    call dfs
    ;golim stiva
    add esp, 8

next:
    inc ecx
    cmp ecx, edx
    jnz find_neigh

continue:

    popa
    leave
    ret
