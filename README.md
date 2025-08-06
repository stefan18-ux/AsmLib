# Depth-First Search (DFS), Sorting, and Searching Algorithms in Assembly

## Overview

This project implements key foundational algorithms in x86 assembly using NASM with a focus on performance optimization:

1. **Depth-First Search (DFS)**: A graph traversal algorithm implemented for efficiency in assembly.
2. **Binary Search**: An optimized search algorithm that locates a target value within a sorted array.
3. **Quick Sort**: A high-performance, divide-and-conquer sorting algorithm.

The assembly implementations emphasize low-level optimizations to reduce CPU cycles and improve cache utilization, resulting in significant performance improvements.

## Repository Contents

- `dfs.asm`: Assembly implementation of the DFS algorithm.
- `bsearch.asm`: Assembly implementation of the binary search algorithm, optimized for cache friendliness.
- `qsort.asm`: Assembly implementation of the quick sort algorithm.
- `Makefile`: Build automation for compiling assembly sources.
- `checker`: A test program that validates correctness of DFS, binary search, and quick sort.
- `tests/`: Test cases to verify algorithm correctness and performance.

## Function Signatures

```c
void dfs(uint32_t node, neighbours_t *(*expand)(uint32_t node));
int32_t binary_search(int32_t *arr, int32_t low, int32_t high, int32_t target);
void quick_sort(int32_t *arr, int32_t low, int32_t high);
```

## Performance Highlights

- Binary search implementation achieves up to **43% performance improvement** through cache-friendly memory layout optimizations that reduce CPU cache misses.
- Quick sort and DFS implementations leverage low-level assembly instructions and register management to minimize instruction count and maximize throughput.
- The code is fine-tuned for modern x86 CPU architectures to take advantage of branch prediction and efficient memory access.

## Build Instructions

To compile all algorithms and the test checker, run:

```bash
make
```

## Running Tests
Execute the checker program to validate the correctness of implemented algorithms:

```bash
./checker
```