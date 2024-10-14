# Depth-First Search (DFS), Sorting and Searching Algorithms in Assembly

## Overview

This project implements two important algorithms in x86 assembly using NASM:
1. **Depth-First Search (DFS)**: A traversal algorithm for graphs.
2. **Binary Search**: A search algorithm that finds the position of a target value within a sorted array.
3. **Quick Sort**: A divide-and-conquer sorting algorithm.

The project includes the following components:
- `dfs.asm`: The assembly implementation of the DFS algorithm.
- `bsearch.asm`: The assembly implementation of binary search.
- `qsort.asm`: The assembly implementation of quick sort.
- `Makefile`: Used to build the assembly code.
- `checker`: A program that verifies the correctness of the DFS and sorting algorithms.
- `tests/`: A directory containing test cases to validate the DFS and sorting algorithms.

## Function Signatures

```c
void dfs(uint32_t node, neighbours_t *(*expand)(uint32_t node));
int32_t binary_search(int32_t *arr, int32_t low, int32_t high, int32_t target);
void quick_sort(int32_t *arr, int32_t low, int32_t high);
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
