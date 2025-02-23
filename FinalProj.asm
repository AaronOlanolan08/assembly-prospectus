.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

.data
    lineBreak1 db 10," |-------------------------------------------------------------------------------", 0
    lineBreak1b db "------------------------------------------------------------------------------|", 0
    close1 db 10," |", 0
    yearLevel4 db 9,9,9,9,9,9,9,9,9,9,"4TH YEAR", 0
    close2 db 9,9,9,9,9,9,9,9,"       |", 0
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
    collegedept db 10," |College/Department       |", 0
    program db 10," |Program                  |", 0
    major db 10," |Major                    |", 0
    collegedept1 db 9,9,9,9,9,9,"College of Teacher Education", 0
    close3 db 9,9,9,9,9,9,9,"       |", 0
    program1 db 9,9,9,9,9,"      BACHELOR OF SECONDARY EDUCATION ", 0
    major1 db 9,9,9,9,9,9,"      SOCIAL STUDIES",9, 0
    yearLevel1 db 9,9,9,9,9,9,9,9,9,9,"1ST YEAR", 0
    frow1 db 10," |GE 2        |   Purposive Communication w/ IL |  6  |  0  |  6    |  none    |", 0
    frow2 db 10," |GE 4        |   Mathematics in the Modern W.. |  3  |  0  |  3    |  none    |", 0
    frow3 db 10," |GE 1        |   Understanding the self        |  3  |  0  |  3    |  none    |", 0
    frow4 db 10," |EDUC 101    |   The Child and Adolescent Le.. |  3  |  0  |  3    |  none    |", 0
    frow5 db 10," |SST 111     |   Foundation of Social Studies  |  3  |  0  |  3    |  none    |", 0
    frow6 db 10," |SST 112     |   Geography 1                   |  3  |  0  |  3    |  none    |", 0
    frow7 db 10," |PAHF        |   Movement Competency Training  |  2  |  0  |  2    |  none    |", 0
    frow8 db 10," |NSTP 1      |   National Service Training P.. |  3  |  0  |  3    |  none    |", 0
    frow1b db " |UGE 1       |   Reading Comprehension         |  6  |  0  |  6    |  GE 2    |",10, 0
    frow2b db " |GE 3        |   The Contemporary World        |  3  |  0  |  3    |  none    |",10, 0
    frow3b db " |EDUC 102    |   Technology for Teaching and.. |  3  |  0  |  3    |  none    |",10, 0
    frow4b db " |EDUC 103    |   Facilitating Learner-Center.. |  3  |  0  |  3    |  EDUC 101|",10, 0
    frow5b db " |SST 121     |   Geography 2                   |  3  |  0  |  3    |  SST 112 |",10, 0
    frow6b db " |SST 122     |   Asian Studies                 |  3  |  0  |  3    |  SST 111 |",10, 0
    frow7b db " |PAHF 2      |   Exercise-based Fitness Acti.. |  2  |  0  |  2    |  PAHF 1  |",10, 0
    frow8b db " |NSTP 2      |   National Service Training A.. |  3  |  0  |  3    |  NSTP 1  |",10, 0
    ftotalrow db 10,9,9,9,"     |  Total Units:   |  26 |  0  |  26   |", 0
    ftotalrowb db 9,9,9,9,9,"      |  Total Units:   |  26 |  0  |  26   |",10, 0  
    summerunit db 10," |                                    SUMMER                                   |", 0
    linefeed db 10,0
    fsummer1 db 10," |GE 5        |   Science, Technology and Soc.. |  3  |  0  |  3    |  none    |", 0
    fsummer2 db 10," |SST 214     |   Wordl History 1               |  3  |  0  |  3    |  SST 111 |", 0
    fsummer3 db 10," |LP 100      |   Strategic Less..              |  3  |  0  |  3    |  none    |", 0
    fstotalrow db 10,9,9,9,"     |  Total Units:   |  9 |  0  |  9   |", 0


.code

start:
try_again:
    invoke ClearScreen

    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr collegedept
    invoke StdOut, addr collegedept1
    invoke StdOut, addr close3
    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr program
    invoke StdOut, addr program1
    invoke StdOut, addr close3
    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr major
    invoke StdOut, addr major1
    invoke StdOut, addr close3
    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr close1
    invoke StdOut, addr yearLevel1
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
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow1
    invoke StdOut, addr frow1b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow2
    invoke StdOut, addr frow2b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow3
    invoke StdOut, addr frow3b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow4
    invoke StdOut, addr frow4b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow5
    invoke StdOut, addr frow5b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow6
    invoke StdOut, addr frow6b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow7
    invoke StdOut, addr frow7b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow8
    invoke StdOut, addr frow8b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr ftotalrow
    invoke StdOut, addr ftotalrowb
    invoke StdOut, addr unitLb
    invoke StdOut, addr unitLb2
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr summerunit
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr fsummer1
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr fsummer2
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr fsummer3
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr fstotalrow
    invoke StdOut, addr linefeed
    invoke StdOut, addr unitLb

    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr close1
    invoke StdOut, addr yearLevel4
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