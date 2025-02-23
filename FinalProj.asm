.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

.data
    yearLevel db "|                                     4TH YEAR                                |", 10, 0
    semUnit db "|First Semester                                | Unit Distribution |  PreReq  |",10, 0
    tableTitle db "|Subj Code   |    Subject Title                | Lec | Lab | Total |          |", 10, 0
    lineBreak1st db "|-----------------------------------------------------------------------------|", 10, 0
    lineBreak db "|------------------------------------------------------------------|          |", 10, 0
    row1 db "|FS 1        |   Field Study 1 (1st T)         |  3  |  0  |  3    |  SST 413 |", 10, 0
    row2 db "|FS 2        |   Field Study 2 (2nd T)         |  3  |  0  |  3    |  SST 413 |", 10, 0
    row3 db "|CA 501      |   General Education             |  5  |  0  |  5    |  SST 413 |", 10, 0
    row4 db "|CA 502      |   Professional Education        |  5  |  0  |  5    |  SST 413 |", 10, 0
    totalRow db 9,9,9,"     |  Total Units:   |  16 |  0  |  16   |", 10, 0
    unitLb db 9,9,9,"     ---------------------------------------"

.code
start:
try_again:
    invoke ClearScreen

    invoke StdOut, addr lineBreak1st
    invoke StdOut, addr yearLevel
    invoke StdOut, addr lineBreak1st
    invoke StdOut, addr semUnit
    invoke StdOut, addr lineBreak
    invoke StdOut, addr tableTitle
    invoke StdOut, addr lineBreak1st
    invoke StdOut, addr row1
    invoke StdOut, addr lineBreak1st
    invoke StdOut, addr row2
    invoke StdOut, addr lineBreak1st
    invoke StdOut, addr row3
    invoke StdOut, addr lineBreak1st
    invoke StdOut, addr row4
    invoke StdOut, addr lineBreak1st
    invoke StdOut, addr totalRow
    invoke StdOut, addr unitLb

    ; Exit program
    invoke ExitProcess, 0
end start
