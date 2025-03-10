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
    fstotalrow db 10,9,9,9,"     |  Total Units:   |  9 |  0  |  9     |", 0

    yearLevel2 db 9,9,9,9,9,9,9,9,9,9,"2ND YEAR", 0
    srow1 db 10," |GE 6        |   Rizal's Life and Works        |  3  |  0  |  3    | none     |", 0
    srow2 db 10," |EDUC 104    |   Foundation of Special..       |  3  |  0  |  3    | none     |", 0
    srow3 db 10," |EDUC 105    |   Assessment of Learning 1      |  3  |  0  |  3    | EDUC 103 |", 0
    srow4 db 10," |SST 211     |   Geography 3                   |  3  |  0  |  3    | SST 121  |", 0
    srow5 db 10," |SST 212     |   Microeconomics                |  3  |  0  |  3    | SST 111  |", 0
    srow6 db 10," |SST 213     |   Law and Related Studies       |  3  |  0  |  3    | none     |", 0
    srow7 db 10," |GE 11       |   The Entrepreneurial Mind      |  3  |  0  |  3    | none     |", 0
    srow8 db 10," |FIL 215     |   Malayuning Komunikasyon..     |  3  |  0  |  3    | none     |", 0
    srow9 db 10," |PAHF 3      |   Dance and Sports 1            |  2  |  0  |  2    | PAHF 2   |", 0
    srow1b db " |EDUC 106   |   The Teacher and the..          |  3  |  0  |  3    |  none    |",10, 0
    srow2b db " |EDUC 107   |   Assessment of Learning 2       |  3  |  0  |  3    |  EDUC 105|",10, 0
    srow3b db " |EDUC 108   |   Building and Enhancing..       |  3  |  0  |  3    |  none    |",10, 0
    srow4b db " |EDUC 109   |   The Teaching Profession        |  3  |  0  |  3    |  none    |",10, 0
    srow5b db " |SST 221    |   Place and Landscapes..         |  3  |  0  |  3    |  SST 211 |",10, 0
    srow6b db " |SST 222    |   Microeconomics                 |  3  |  0  |  3    |  SST 212 |",10, 0
    srow7b db " |SST 223    |   World History 2                |  3  |  0  |  3    |  SST 214 |",10, 0
    srow8b db " |GE 7       |   Art Appreciation               |  3  |  0  |  3    |  none    |",10, 0
    srow9b db " |PAHF 4     |   Dance and Sports 2             |  2  |  0  |  2    |  PAHF 3  |",10, 0
    stotalrow db 10,9,9,9,"     |  Total Units:   |  26 |  0  |  26    |", 0 
    stotalrow2 db 9,9,9,9,9,"      |  Total Units:   |  26 |  0  |  26   |",10, 0

    ssummerunit db 10," |                                    SUMMER                                   |", 0
    ssummer1 db 10," |GE 15        |   Environmental Science       |  3  |  0  |  3    |  none     |", 0
    ssummer2 db 10," |GE 8         |   Reading in....              |  3  |  0  |  3    |  SST 111  |", 0
    ssummer3 db 10," |GE 20        |   Reading Visual..            |  3  |  0  |  3    |  none     |", 0
    sstotalrow db 10,9,9,9,"     |  Total Units:   |  9 |  0  |  9     |", 0

    yearLevel3 db 9,9,9,9,9,9,9,9,9,9,"3RD YEAR", 0
    trow1 db 10," |GE2         |  Ethics (Disciplinal)           |  3  |  0  |  3    |  none    |", 0
    trow2 db 10," |EDUC 110    |  Teacher and Community, Sch..   |  3  |  0  |  3    |  none    |", 0
    trow3 db 10," |SST 412     |  Research in Social Studies     |  3  |  0  |  3    | EDUC 107 |", 0
    trow4 db 10," |SS7 311     |  Socio-Cultural Anthropology    |  3  |  0  |  3    |  none    |", 0
    trow5 db 10," |SST 312     |  Trends and Issues in Socia..   |  3  |  0  |  3    |  none    |", 0
    trow6 db 10," |SS7 313     |  Teaching Approaches in Se..    |  3  |  0  |  3    | EDUC 103 |", 0
    trow7 db 10," |SS7 314     |  Comparative Economic Planni..  |  3  |  0  |  3    | SST 222  |", 0
    trow8 db 10,"|SS7 315      |  Basic of School Managem..      |  3  |  0  |  3    |  none    |", 0
    trow1b db " |SST 321     |   Comparative Government an.    |  3  |  0  |  3    |  SST 222 |",10, 0   
    trow2b db " |SST 322     |   Production of Social Stud..   |  3  |  0  |  3    |  SST 313 |",10, 0
    trow3b db " |SST 323     |   Assessment and Evaluatio..    |  3  |  0  |  3    |  SST 222 |",10, 0
    trow4b db " |SST 324/L   |   Technology for Teaching..     |  2  |  1  |  3    |  EDUC 102|",10, 0
    trow5b db " |SST 325     |   Social Networking for Soc..   |  3  |  0  |  3    |  SST 311 |",10, 0
    trow6b db " |SST 326     |   Integrative Methods in T..    |  3  |  0  |  3    |  SST 313 |",10, 0
    trow7b db " |SST 413     |   Research in Social Studie..   |  3  |  0  |  3    |  SST 412 |",10, 0
    trow8b db " |CAED 500c   |   Career and Personality..      |  3  |  0  |  3    |  3rd yr  |",10, 0
    ttotalrow db 10,9,9,9,"     |  Total Units:   |  24 |  0  |  24   |", 0
    ttotalrow2 db 9,9,9,9,9,"      |  Total Units:   |  23 |  1  |  24   |",10, 0

    empty_table_close2 db 9,9,9,9,9,9,9,9,9,"       |", 0
.data
    chooseYear db 10,"Choose a year level (1 = 1st year, 2 = 2nd year, 3 = 3rd year, 4 = 4th year): ", 0
    pickSem db 10, "Enter semester (1 = 1st sem, 2 = 2nd sem, 3 = summer): ", 0
    enterCode db 10, "Enter subject code to add: ", 0
    yearChoice dd ?
    semChoice dd ?
    subjChoice dd ?
    buffer db 20 dup(0)
.code

start:
    invoke ClearScreen
    jmp second_prompt

second_prompt:
    invoke StdOut, addr chooseYear
    invoke StdIn, addr buffer, sizeof buffer
    invoke atodw, addr buffer
    mov yearChoice, eax

    cmp yearChoice, 1
    je third_prompt1
    cmp yearChoice, 2
    je second_year
    cmp yearChoice, 3
    je third_year
    cmp yearChoice, 4
    je fourth_year

third_prompt1:
    invoke StdOut, addr pickSem
    invoke StdIn, addr buffer, sizeof buffer
    invoke atodw, addr buffer
    mov semChoice, eax

    cmp semChoice, 1
    je first_year_sem1
    cmp semChoice, 2
    je first_year_sem2
    cmp semChoice, 3
    je first_year_summer

third_prompt_display:
    invoke StdOut, addr chooseYear
    invoke StdIn, addr buffer, sizeof buffer
    invoke atodw, addr buffer
    mov yearChoice, eax

    cmp yearChoice, 1
    je header
    je first_year
    cmp yearChoice, 2
    je second_year
    cmp yearChoice, 3
    je third_year
    cmp yearChoice, 4
    je fourth_year

header:
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
    
enter_code:
    invoke StdOut, addr enterCode
    invoke StdIn, addr buffer, sizeof buffer
    invoke atodw, addr buffer
    mov subjChoice, eax



first_year:
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
    invoke StdOut, addr linefeed
    jmp third_prompt_display

first_year_sem1:
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr semUnit
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr linefeed
    invoke StdOut, addr tableTitle
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow1
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow2
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow3
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow4
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow5
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow6
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow7
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr frow8
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr ftotalrow
    invoke StdOut, addr linefeed
    invoke StdOut, addr unitLb
    jmp enter_code

first_year_sem2:
    invoke StdOut, addr tableTitle2
    invoke StdOut, addr sem2Unit
    invoke StdOut, addr frow1b
    invoke StdOut, addr frow2b
    invoke StdOut, addr frow3b
    invoke StdOut, addr frow4b
    invoke StdOut, addr frow5b
    invoke StdOut, addr frow6b
    invoke StdOut, addr frow7b
    invoke StdOut, addr frow8b
    invoke StdOut, addr ftotalrowb

first_year_summer:
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
    invoke StdOut, addr linefeed
    jmp third_prompt_display

second_year:
    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr close1
    invoke StdOut, addr yearLevel2
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
    invoke StdOut, addr srow1
    invoke StdOut, addr srow1b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr srow2
    invoke StdOut, addr srow2b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr srow3
    invoke StdOut, addr srow3b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr srow4
    invoke StdOut, addr srow4b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr srow5
    invoke StdOut, addr srow5b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr srow6
    invoke StdOut, addr srow6b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr srow7
    invoke StdOut, addr srow7b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr srow8
    invoke StdOut, addr srow8b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr stotalrow
    invoke StdOut, addr stotalrow2
    invoke StdOut, addr unitLb
    invoke StdOut, addr unitLb2
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr ssummerunit
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr ssummer1
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr ssummer2
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr ssummer3
    invoke StdOut, addr linefeed
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr sstotalrow
    invoke StdOut, addr linefeed
    invoke StdOut, addr unitLb
    invoke StdOut, addr linefeed
    jmp third_prompt_display

third_year:
    invoke StdOut, addr lineBreak1
    invoke StdOut, addr lineBreak1b
    invoke StdOut, addr close1
    invoke StdOut, addr yearLevel3
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
    invoke StdOut, addr trow1
    invoke StdOut, addr trow1b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr trow2
    invoke StdOut, addr trow2b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr trow3
    invoke StdOut, addr trow3b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr trow4
    invoke StdOut, addr trow4b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr trow5
    invoke StdOut, addr trow5b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr trow6
    invoke StdOut, addr trow6b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr trow7
    invoke StdOut, addr trow7b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr trow8
    invoke StdOut, addr trow8b
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr lineBreak2
    invoke StdOut, addr ttotalrow
    invoke StdOut, addr ttotalrow2
    invoke StdOut, addr unitLb
    invoke StdOut, addr unitLb2
    invoke StdOut, addr linefeed
    jmp third_prompt_display

fourth_year:
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
    jmp third_prompt_display

    ; Exit program
    invoke ExitProcess, 0
end start