.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

.data
    lineBreak1 db " |-------------------------------------------------------------------------------", 0
    lineBreak1b db "------------------------------------------------------------------------------|", 0
    close1 db 10," |", 0
    yearLevel db 9,9,9,9,9,9,9,9,9,9,"4TH YEAR", 0
    close2 db 9,9,9,9,9,9,9,9,"       |",10, 0
    semUnit db 10," |First Semester                                | Unit Distribution |  PreReq  |", 0
    tableTitle db " |Subj Code   |    Subject Title                | Lec | Lab | Total |          |", 0
    lineBreak2 db " |-----------------------------------------------------------------------------|", 0
    lineBreak3 db " |------------------------------------------------------------------|          |", 0
    row1 db 10," |FS 1        |   Field Study 1 (1st T)         |  3  |  0  |  3    |  SST 413 |",10, 0
    row2 db 10," |FS 2        |   Field Study 2 (2nd T)         |  3  |  0  |  3    |  SST 413 |",10, 0
    row3 db 10," |CA 501      |   General Education             |  5  |  0  |  5    |  SST 413 |", 0
    row4 db 10," |CA 502      |   Professional Education        |  5  |  0  |  5    |  SST 413 |", 0
    totalRow db 10,9,9,9,"     |  Total Units:   |  16 |  0  |  16   |", 0
    unitLb db 9,9,9,"     ---------------------------------------", 0
    sem2Unit db " |Second Semester                               | Unit Distribution |  PreReq  |",10, 0
    lineBreak3b db " |------------------------------------------------------------------|          |", 10, 0
    tableTitle2 db " |Subj Code   |    Subject Title                | Lec | Lab | Total |          |",10, 0
    row3b db " |ED 421      |   Teaching Internship           |  6  |  0  |  6    |  SST 413 |",10, 0
    row4b db " |CA 503      |   Specialization                |  5  |  0  |  5    |  SST 413 |",10, 0
    totalRow2 db 9,9,9,9,9,"      |  Total Units:   |  11 |  0  |  11   |",10, 0
    unitLb2 db 9,9,9,9,9,"      ---------------------------------------", 0

.code
start:
try_again:
    invoke ClearScreen

    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr close1
    invoke StdOut, addr yearLevel
    invoke StdOut, addr close2
    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr semUnit
    invoke StdOut, addr sem2Unit
    invoke StdOut, addr lineBreak3
    invoke StdOut, addr lineBreak3b
    invoke StdOut, addr tableTitle
    invoke StdOut, addr tableTitle2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr row1
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr row2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr row3
    invoke StdOut, addr row3b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr row4
    invoke StdOut, addr row4b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr totalRow
    invoke StdOut, addr totalRow2
    invoke StdOut, addr unitLb
    invoke StdOut, addr unitLb2

    ; Exit program
    invoke ExitProcess, 0
end start
