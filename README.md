# MIPS Array Subtractor

## Summary
This was an assignment for my Computer Architecture and Organization class. It is written in assembly code (specifically for the MIPS architecture) and takes two equal-length arrays, subtrafcts their values, stores them in  an 'array', then spits the 'array' back to the user.

It is implied that both arrays are of the same length and contain integers only.

## Original Project Overview
Write a MIPS assembly language program that subtracts two arrays with ten elements (element-by-element subtraction) and save them in an array. Print the Result Array.

Code in java:

```
int [ ]  A =  {10,  5,  6,  15,  17,  19,  25,  30,  12,  56 };
int [ ]  B =  {4,  15,  16,  5,  7,  9,  15,  10,  22,  6 };
int [ ]  C =   new  int[10];

for  (int  i=0;   i<A.length;   i++)
    C[i]=A[i]  -  B[i];
    System.out.println("Result is "  +   Arrays.toString(C));
```
