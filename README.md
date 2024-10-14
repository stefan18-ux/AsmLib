# Depth-First Search (DFS) in Assembly

## Overview

This project implements the **Depth-First Search (DFS)** algorithm in x86 assembly using NASM. The `dfs` function traverses a graph starting from a given node, printing each visited node. The graph structure is dynamically provided by the `expand` function, which returns the neighbors of a given node.

The project includes the following components:
- `dfs.asm`: The assembly implementation of the DFS algorithm.
- `Makefile`: Used to build the assembly code.
- `checker`: A program that verifies the correctness of the DFS implementation.
- `tests/`: A directory containing test cases to validate the DFS implementation.

## Function Signature

```c
void dfs(uint32_t node, neighbours_t *(*expand)(uint32_t node));
```

## How to Build

To compile the DFS program, use the following command:

```bash
make
```

To run the DFS program, use the following command:
```bash
./checker
```