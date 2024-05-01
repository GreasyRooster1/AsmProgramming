@ECHO OFF
as .\asem.s -msyntax=intel  -o asem.o
gcc -o asem asem.o -nostdlib -static
.\asem.exe