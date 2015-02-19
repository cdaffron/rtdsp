;******************************************************************************
;* TMS320C6x C/C++ Codegen                                         PC v7.4.12 *
;* Date/Time created: Wed Feb 18 16:12:17 2015                                *
;******************************************************************************
	.compiler_opts --abi=coffabi --c64p_l1d_workaround=default --endian=little --hll_source=on --long_precision_bits=40 --mem_model:code=near --mem_model:const=data --mem_model:data=far_aggregates --object_format=coff --silicon_version=6710 --symdebug:dwarf 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C671x                                          *
;*   Optimization      : Enabled at level 2                                   *
;*   Optimizing for    : Speed                                                *
;*                       Based on options: -o2, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Data Access Model : Far Aggregate Data                                   *
;*   Pipelining        : Enabled                                              *
;*   Speculate Loads   : Enabled with threshold = 0                           *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : DWARF Debug                                          *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../dotp4.c")
	.dwattr $C$DW$CU, DW_AT_producer("TMS320C6x C/C++ Codegen PC v7.4.12 Copyright (c) 1996-2014 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("C:\Users\cdaffron\git\rtdsp\lab2\Dotp4\Debug")
;*****************************************************************************
;* CINIT RECORDS                                                             *
;*****************************************************************************
	.sect	".cinit"
	.align	8
	.field  	$C$IR_1,32
	.field  	_x+0,32
	.bits	1,16			; _x[0] @ 0
	.bits	2,16			; _x[1] @ 16
	.bits	3,16			; _x[2] @ 32
	.bits	4,16			; _x[3] @ 48
$C$IR_1:	.set	8

	.sect	".cinit"
	.align	8
	.field  	$C$IR_2,32
	.field  	_y+0,32
	.bits	0,16			; _y[0] @ 0
	.bits	2,16			; _y[1] @ 16
	.bits	4,16			; _y[2] @ 32
	.bits	6,16			; _y[3] @ 48
$C$IR_2:	.set	8

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sum+0,32
	.bits	0,32			; _sum @ 0


$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("printf")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("_printf")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$28)
$C$DW$3	.dwtag  DW_TAG_unspecified_parameters
	.dwendtag $C$DW$1

	.global	_x
_x:	.usect	".far",8,4
$C$DW$4	.dwtag  DW_TAG_variable, DW_AT_name("x")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("_x")
	.dwattr $C$DW$4, DW_AT_location[DW_OP_addr _x]
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$4, DW_AT_external
	.global	_y
_y:	.usect	".far",8,4
$C$DW$5	.dwtag  DW_TAG_variable, DW_AT_name("y")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("_y")
	.dwattr $C$DW$5, DW_AT_location[DW_OP_addr _y]
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$5, DW_AT_external
	.global	_sum
	.bss	_sum,4,4
$C$DW$6	.dwtag  DW_TAG_variable, DW_AT_name("sum")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("_sum")
	.dwattr $C$DW$6, DW_AT_location[DW_OP_addr _sum]
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$6, DW_AT_external
;	c:\ti\ccsv6\tools\compiler\c6000_7.4.12\bin\opt6x.exe C:\\Users\\cdaffron\\AppData\\Local\\Temp\\341442 C:\\Users\\cdaffron\\AppData\\Local\\Temp\\341444 
	.sect	".text"
	.clink
	.global	_dotp

$C$DW$7	.dwtag  DW_TAG_subprogram, DW_AT_name("dotp")
	.dwattr $C$DW$7, DW_AT_low_pc(_dotp)
	.dwattr $C$DW$7, DW_AT_high_pc(0x00)
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("_dotp")
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$7, DW_AT_TI_begin_file("../dotp4.c")
	.dwattr $C$DW$7, DW_AT_TI_begin_line(0x12)
	.dwattr $C$DW$7, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$7, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "../dotp4.c",line 19,column 1,is_stmt,address _dotp

	.dwfde $C$DW$CIE, _dotp
$C$DW$8	.dwtag  DW_TAG_formal_parameter, DW_AT_name("a")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("_a")
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$8, DW_AT_location[DW_OP_reg4]
$C$DW$9	.dwtag  DW_TAG_formal_parameter, DW_AT_name("b")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("_b")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$9, DW_AT_location[DW_OP_reg20]
$C$DW$10	.dwtag  DW_TAG_formal_parameter, DW_AT_name("ncount")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("_ncount")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$10, DW_AT_location[DW_OP_reg6]

;******************************************************************************
;* FUNCTION NAME: dotp                                                        *
;*                                                                            *
;*   Regs Modified     : A1,A3,A4,A5,A6,B0,B1,B4,B5,B6                        *
;*   Regs Used         : A1,A3,A4,A5,A6,B0,B1,B3,B4,B5,B6,DP,SP               *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o2) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_dotp:
;** --------------------------------------------------------------------------*
;** 22	-----------------------    if ( ncount > 0 ) goto g3;
;**  	-----------------------    sum = 0;
;** 24	-----------------------    return 0;
	.dwcfi	cfa_offset, 0
	.dwcfi	save_reg_to_reg, 228, 19
$C$DW$11	.dwtag  DW_TAG_variable, DW_AT_name("$O$v1")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("$O$v1")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$11, DW_AT_location[DW_OP_reg6]
$C$DW$12	.dwtag  DW_TAG_variable, DW_AT_name("a")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("_a")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$12, DW_AT_location[DW_OP_reg4]
$C$DW$13	.dwtag  DW_TAG_variable, DW_AT_name("b")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("_b")
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$13, DW_AT_location[DW_OP_reg5]
$C$DW$14	.dwtag  DW_TAG_variable, DW_AT_name("ncount")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("_ncount")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$14, DW_AT_location[DW_OP_reg6]
$C$DW$15	.dwtag  DW_TAG_variable, DW_AT_name("$O$L1")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("$O$L1")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$15, DW_AT_location[DW_OP_reg16]
$C$DW$16	.dwtag  DW_TAG_variable, DW_AT_name("$O$U14")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("$O$U14")
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$16, DW_AT_location[DW_OP_reg20]
$C$DW$17	.dwtag  DW_TAG_variable, DW_AT_name("$O$U12")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("$O$U12")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$17, DW_AT_location[DW_OP_reg5]
           MV      .L1X    B4,A5             ; |19| 
	.dwpsn	file "../dotp4.c",line 22,column 15,is_stmt
           CMPGT   .L1     A6,0,A1           ; |22| 
   [!A1]   ZERO    .L2     B4
   [!A1]   STW     .D2T2   B4,*+DP(_sum)
	.dwpsn	file "../dotp4.c",line 24,column 3,is_stmt
   [!A1]   B       .S1     $C$L7             ; |24| 
   [!A1]   ZERO    .L1     A3                ; |24| 
           NOP             4
           ; BRANCHCC OCCURS {$C$L7}         ; |24| 
;** --------------------------------------------------------------------------*
;**	-----------------------g3:
;**  	-----------------------    U$12 = b;
;**  	-----------------------    U$14 = a;
;** 23	-----------------------    L$1 = ncount;
;** 21	-----------------------    v$1 = 0;
;**  	-----------------------    #pragma MUST_ITERATE(1, 18446744073709551615, 1)
;**  	-----------------------    #pragma LOOP_FLAGS(4096u)
           MV      .L2X    A4,B4
	.dwpsn	file "../dotp4.c",line 23,column 6,is_stmt
           MV      .L2X    A6,B0             ; |23| 
	.dwpsn	file "../dotp4.c",line 21,column 3,is_stmt
           CMPGT   .L2     B0,6,B1
   [ B1]   B       .S1     $C$L2
           ZERO    .L1     A6                ; |21| 
           NOP             4
           ; BRANCHCC OCCURS {$C$L2} {0} 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L1
;** --------------------------------------------------------------------------*
$C$L1:    
$C$DW$L$_dotp$3$B:
;**	-----------------------g4:
;** 23	-----------------------    v$1 += _mpy(*U$14++, *U$12++);
;** 22	-----------------------    if ( L$1 = L$1-1 ) goto g4;
	.dwpsn	file "../dotp4.c",line 23,column 6,is_stmt

           LDH     .D1T1   *A5++,A3          ; |23| 
||         LDH     .D2T2   *B4++,B5          ; |23| 

           NOP             4
$C$DW$L$_dotp$3$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_dotp$4$B:
;**  	-----------------------    sum = v$1;
           MPY     .M1X    B5,A3,A3          ; |23| 
           NOP             1
           ADD     .L1     A3,A6,A6          ; |23| 
	.dwpsn	file "../dotp4.c",line 22,column 15,is_stmt
           SUB     .L2     B0,1,B0           ; |22| 
   [ B0]   B       .S1     $C$L1             ; |22| 
   [!B0]   B       .S1     $C$L6
           NOP             4
           ; BRANCHCC OCCURS {$C$L1}         ; |22| 
$C$DW$L$_dotp$4$E:
;** --------------------------------------------------------------------------*
           NOP             1
           ; BRANCH OCCURS {$C$L6}  
;** --------------------------------------------------------------------------*
$C$L2:    

           MVC     .S2     CSR,B6
||         LDH     .D1T1   *A5++,A3          ; |23| (P) <0,0> 

           AND     .L2     -2,B6,B5

           MVC     .S2     B5,CSR            ; interrupts off
||         LDH     .D2T2   *B4++,B5          ; |23| (P) <0,0> 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : ../dotp4.c
;*      Loop source line                 : 22
;*      Loop opening brace source line   : 23
;*      Loop closing brace source line   : 23
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 0
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        1*    
;*      .D units                     1*       1*    
;*      .M units                     1*       0     
;*      .X cross paths               1*       0     
;*      .T address paths             1*       1*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             0        1*    
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 1  Schedule found with 8 iterations in parallel
;*      Done
;*
;*      Collapsed epilog stages       : 7
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh14
;*
;*      Minimum safe trip count       : 7
;*----------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP PROLOG

           LDH     .D1T1   *A5++,A3          ; |23| (P) <1,0> 
||         LDH     .D2T2   *B4++,B5          ; |23| (P) <1,0> 

           B       .S2     $C$L4             ; |22| (P) <0,2> 
||         LDH     .D1T1   *A5++,A3          ; |23| (P) <2,0> 
||         LDH     .D2T2   *B4++,B5          ; |23| (P) <2,0> 

           SUB     .L2     B0,6,B0
||         B       .S2     $C$L4             ; |22| (P) <1,2> 
||         LDH     .D1T1   *A5++,A3          ; |23| (P) <3,0> 
||         LDH     .D2T2   *B4++,B5          ; |23| (P) <3,0> 

           SUB     .L1X    B0,1,A1
||         B       .S2     $C$L4             ; |22| (P) <2,2> 
||         LDH     .D1T1   *A5++,A3          ; |23| (P) <4,0> 
||         LDH     .D2T2   *B4++,B5          ; |23| (P) <4,0> 

           MPY     .M1X    B5,A3,A4          ; |23| (P) <0,5> 
||         B       .S2     $C$L4             ; |22| (P) <3,2> 
||         LDH     .D1T1   *A5++,A3          ; |23| (P) <5,0> 
||         LDH     .D2T2   *B4++,B5          ; |23| (P) <5,0> 

           MPY     .M1X    B5,A3,A4          ; |23| (P) <1,5> 
||         B       .S2     $C$L4             ; |22| (P) <4,2> 
||         LDH     .D1T1   *A5++,A3          ; |23| (P) <6,0> 
||         LDH     .D2T2   *B4++,B5          ; |23| (P) <6,0> 

;** --------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP KERNEL
$C$DW$L$_dotp$8$B:

   [ A1]   SUB     .L1     A1,1,A1           ; <0,7> 
||         ADD     .S1     A4,A6,A6          ; |23| <0,7> 
||         MPY     .M1X    B5,A3,A4          ; |23| <2,5> 
|| [ B0]   B       .S2     $C$L4             ; |22| <5,2> 
|| [ B0]   SUB     .L2     B0,1,B0           ; |22| <6,1> 
|| [ A1]   LDH     .D1T1   *A5++,A3          ; |23| <7,0> 
|| [ A1]   LDH     .D2T2   *B4++,B5          ; |23| <7,0> 

$C$DW$L$_dotp$8$E:
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
           MVC     .S2     B6,CSR            ; interrupts on
           NOP             2
;** --------------------------------------------------------------------------*
$C$L6:    
;** 24	-----------------------    return v$1;
           STW     .D2T1   A6,*+DP(_sum)
	.dwpsn	file "../dotp4.c",line 24,column 3,is_stmt
           MV      .L1     A6,A3             ; |24| 
;** --------------------------------------------------------------------------*
$C$L7:    
	.dwpsn	file "../dotp4.c",line 25,column 1,is_stmt
           MV      .L1     A3,A4             ; |24| 
	.dwcfi	cfa_offset, 0
$C$DW$18	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$18, DW_AT_low_pc(0x00)
	.dwattr $C$DW$18, DW_AT_TI_return
           RET     .S2     B3                ; |25| 
           NOP             5
           ; BRANCH OCCURS {B3}              ; |25| 

$C$DW$19	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$19, DW_AT_name("C:\Users\cdaffron\git\rtdsp\lab2\Dotp4\Debug\dotp4.asm:$C$L4:1:1424293937")
	.dwattr $C$DW$19, DW_AT_TI_begin_file("../dotp4.c")
	.dwattr $C$DW$19, DW_AT_TI_begin_line(0x16)
	.dwattr $C$DW$19, DW_AT_TI_end_line(0x17)
$C$DW$20	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$20, DW_AT_low_pc($C$DW$L$_dotp$8$B)
	.dwattr $C$DW$20, DW_AT_high_pc($C$DW$L$_dotp$8$E)
	.dwendtag $C$DW$19


$C$DW$21	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$21, DW_AT_name("C:\Users\cdaffron\git\rtdsp\lab2\Dotp4\Debug\dotp4.asm:$C$L1:1:1424293937")
	.dwattr $C$DW$21, DW_AT_TI_begin_file("../dotp4.c")
	.dwattr $C$DW$21, DW_AT_TI_begin_line(0x16)
	.dwattr $C$DW$21, DW_AT_TI_end_line(0x17)
$C$DW$22	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$22, DW_AT_low_pc($C$DW$L$_dotp$3$B)
	.dwattr $C$DW$22, DW_AT_high_pc($C$DW$L$_dotp$3$E)
$C$DW$23	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$23, DW_AT_low_pc($C$DW$L$_dotp$4$B)
	.dwattr $C$DW$23, DW_AT_high_pc($C$DW$L$_dotp$4$E)
	.dwendtag $C$DW$21

	.dwattr $C$DW$7, DW_AT_TI_end_file("../dotp4.c")
	.dwattr $C$DW$7, DW_AT_TI_end_line(0x19)
	.dwattr $C$DW$7, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$7

	.sect	".text"
	.clink
	.global	_main

$C$DW$24	.dwtag  DW_TAG_subprogram, DW_AT_name("main")
	.dwattr $C$DW$24, DW_AT_low_pc(_main)
	.dwattr $C$DW$24, DW_AT_high_pc(0x00)
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("_main")
	.dwattr $C$DW$24, DW_AT_external
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$24, DW_AT_TI_begin_file("../dotp4.c")
	.dwattr $C$DW$24, DW_AT_TI_begin_line(0x0a)
	.dwattr $C$DW$24, DW_AT_TI_begin_column(0x01)
	.dwattr $C$DW$24, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../dotp4.c",line 11,column 1,is_stmt,address _main

	.dwfde $C$DW$CIE, _main

;******************************************************************************
;* FUNCTION NAME: main                                                        *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,DP,SP                                   *
;*   Local Frame Size  : 8 Args + 0 Auto + 4 Save = 12 byte                   *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o2) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;** 14	-----------------------    result = dotp(&x, &y, 4);
;** 15	-----------------------    printf((const char *)"result = %d (decimal) \n", result);
;** 16	-----------------------    return 0;
	.dwcfi	cfa_offset, 0
	.dwcfi	save_reg_to_reg, 228, 19
           STW     .D2T2   B3,*SP--(16)      ; |11| 
	.dwcfi	cfa_offset, 16
	.dwcfi	save_reg_to_mem, 19, 0
$C$DW$25	.dwtag  DW_TAG_variable, DW_AT_name("result")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("_result")
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$25, DW_AT_location[DW_OP_reg4]
	.dwpsn	file "../dotp4.c",line 14,column 3,is_stmt
$C$DW$26	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$26, DW_AT_low_pc(0x00)
	.dwattr $C$DW$26, DW_AT_name("_dotp")
	.dwattr $C$DW$26, DW_AT_TI_call
           CALL    .S1     _dotp             ; |14| 
           MVKL    .S2     _y,B4
           MVKL    .S2     $C$RL0,B3         ; |14| 
           MVKL    .S1     _x,A4

           MVKH    .S2     _y,B4
||         MVK     .S1     0x4,A6            ; |14| 

           MVKH    .S1     _x,A4
||         MVKH    .S2     $C$RL0,B3         ; |14| 

$C$RL0:    ; CALL OCCURS {_dotp} {0}         ; |14| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../dotp4.c",line 15,column 3,is_stmt
$C$DW$27	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$27, DW_AT_low_pc(0x00)
	.dwattr $C$DW$27, DW_AT_name("_printf")
	.dwattr $C$DW$27, DW_AT_TI_call
           CALL    .S1     _printf           ; |15| 
           MVKL    .S2     $C$SL1+0,B4
           MVKL    .S2     $C$RL1,B3         ; |15| 
           MVKH    .S2     $C$SL1+0,B4
           STW     .D2T1   A4,*+SP(8)        ; |15| 

           STW     .D2T2   B4,*+SP(4)        ; |15| 
||         MVKH    .S2     $C$RL1,B3         ; |15| 

$C$RL1:    ; CALL OCCURS {_printf} {0}       ; |15| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../dotp4.c",line 16,column 1,is_stmt
           LDW     .D2T2   *++SP(16),B3      ; |16| 
           ZERO    .L1     A4                ; |16| 
           NOP             3
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0
$C$DW$28	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$28, DW_AT_low_pc(0x00)
	.dwattr $C$DW$28, DW_AT_TI_return
           RET     .S2     B3                ; |16| 
           NOP             5
           ; BRANCH OCCURS {B3}              ; |16| 
	.dwattr $C$DW$24, DW_AT_TI_end_file("../dotp4.c")
	.dwattr $C$DW$24, DW_AT_TI_end_line(0x10)
	.dwattr $C$DW$24, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$24

;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"result = %d (decimal) ",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_preserved(0)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(0)

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$23	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$23, DW_AT_address_class(0x20)
$C$DW$T$24	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$23)

$C$DW$T$25	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$25, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x08)
$C$DW$29	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$29, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$25

$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$34	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$10)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$12, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$12, DW_AT_bit_offset(0x18)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$13, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$13, DW_AT_bit_offset(0x18)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)
$C$DW$T$26	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$26, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$26, DW_AT_name("signed char")
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x01)
$C$DW$T$27	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$T$26)
$C$DW$T$28	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$28, DW_AT_address_class(0x20)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 228
	.dwcfi	cfa_register, 31
	.dwcfi	cfa_offset, 0
	.dwcfi	undefined, 0
	.dwcfi	undefined, 1
	.dwcfi	undefined, 2
	.dwcfi	undefined, 3
	.dwcfi	undefined, 4
	.dwcfi	undefined, 5
	.dwcfi	undefined, 6
	.dwcfi	undefined, 7
	.dwcfi	undefined, 8
	.dwcfi	undefined, 9
	.dwcfi	same_value, 10
	.dwcfi	same_value, 11
	.dwcfi	same_value, 12
	.dwcfi	same_value, 13
	.dwcfi	same_value, 14
	.dwcfi	same_value, 15
	.dwcfi	undefined, 16
	.dwcfi	undefined, 17
	.dwcfi	undefined, 18
	.dwcfi	undefined, 19
	.dwcfi	undefined, 20
	.dwcfi	undefined, 21
	.dwcfi	undefined, 22
	.dwcfi	undefined, 23
	.dwcfi	undefined, 24
	.dwcfi	undefined, 25
	.dwcfi	same_value, 26
	.dwcfi	same_value, 27
	.dwcfi	same_value, 28
	.dwcfi	same_value, 29
	.dwcfi	same_value, 30
	.dwcfi	same_value, 31
	.dwcfi	same_value, 32
	.dwcfi	undefined, 33
	.dwcfi	undefined, 34
	.dwcfi	undefined, 35
	.dwcfi	undefined, 36
	.dwcfi	undefined, 37
	.dwcfi	undefined, 38
	.dwcfi	undefined, 39
	.dwcfi	undefined, 40
	.dwcfi	undefined, 41
	.dwcfi	undefined, 42
	.dwcfi	undefined, 43
	.dwcfi	undefined, 44
	.dwcfi	undefined, 45
	.dwcfi	undefined, 46
	.dwcfi	undefined, 47
	.dwcfi	undefined, 48
	.dwcfi	undefined, 49
	.dwcfi	undefined, 50
	.dwcfi	undefined, 51
	.dwcfi	undefined, 52
	.dwcfi	undefined, 53
	.dwcfi	undefined, 54
	.dwcfi	undefined, 55
	.dwcfi	undefined, 56
	.dwcfi	undefined, 57
	.dwcfi	undefined, 58
	.dwcfi	undefined, 59
	.dwcfi	undefined, 60
	.dwcfi	undefined, 61
	.dwcfi	undefined, 62
	.dwcfi	undefined, 63
	.dwcfi	undefined, 64
	.dwcfi	undefined, 65
	.dwcfi	undefined, 66
	.dwcfi	undefined, 67
	.dwcfi	undefined, 68
	.dwcfi	undefined, 69
	.dwcfi	undefined, 70
	.dwcfi	undefined, 71
	.dwcfi	undefined, 72
	.dwcfi	undefined, 73
	.dwcfi	undefined, 74
	.dwcfi	undefined, 75
	.dwcfi	undefined, 76
	.dwcfi	undefined, 77
	.dwcfi	undefined, 78
	.dwcfi	undefined, 79
	.dwcfi	undefined, 80
	.dwcfi	undefined, 81
	.dwcfi	undefined, 82
	.dwcfi	undefined, 83
	.dwcfi	undefined, 84
	.dwcfi	undefined, 85
	.dwcfi	undefined, 86
	.dwcfi	undefined, 87
	.dwcfi	undefined, 88
	.dwcfi	undefined, 89
	.dwcfi	undefined, 90
	.dwcfi	undefined, 91
	.dwcfi	undefined, 92
	.dwcfi	undefined, 93
	.dwcfi	undefined, 94
	.dwcfi	undefined, 95
	.dwcfi	undefined, 96
	.dwcfi	undefined, 97
	.dwcfi	undefined, 98
	.dwcfi	undefined, 99
	.dwcfi	undefined, 100
	.dwcfi	undefined, 101
	.dwcfi	undefined, 102
	.dwcfi	undefined, 103
	.dwcfi	undefined, 104
	.dwcfi	undefined, 105
	.dwcfi	undefined, 106
	.dwcfi	undefined, 107
	.dwcfi	undefined, 108
	.dwcfi	undefined, 109
	.dwcfi	undefined, 110
	.dwcfi	undefined, 111
	.dwcfi	undefined, 112
	.dwcfi	undefined, 113
	.dwcfi	undefined, 114
	.dwcfi	undefined, 115
	.dwcfi	undefined, 116
	.dwcfi	undefined, 117
	.dwcfi	undefined, 118
	.dwcfi	undefined, 119
	.dwcfi	undefined, 120
	.dwcfi	undefined, 121
	.dwcfi	undefined, 122
	.dwcfi	undefined, 123
	.dwcfi	undefined, 124
	.dwcfi	undefined, 125
	.dwcfi	undefined, 126
	.dwcfi	undefined, 127
	.dwcfi	undefined, 128
	.dwcfi	undefined, 129
	.dwcfi	undefined, 130
	.dwcfi	undefined, 131
	.dwcfi	undefined, 132
	.dwcfi	undefined, 133
	.dwcfi	undefined, 134
	.dwcfi	undefined, 135
	.dwcfi	undefined, 136
	.dwcfi	undefined, 137
	.dwcfi	undefined, 138
	.dwcfi	undefined, 139
	.dwcfi	undefined, 140
	.dwcfi	undefined, 141
	.dwcfi	undefined, 142
	.dwcfi	undefined, 143
	.dwcfi	undefined, 144
	.dwcfi	undefined, 145
	.dwcfi	undefined, 146
	.dwcfi	undefined, 147
	.dwcfi	undefined, 148
	.dwcfi	undefined, 149
	.dwcfi	undefined, 150
	.dwcfi	undefined, 151
	.dwcfi	undefined, 152
	.dwcfi	undefined, 153
	.dwcfi	undefined, 154
	.dwcfi	undefined, 155
	.dwcfi	undefined, 156
	.dwcfi	undefined, 157
	.dwcfi	undefined, 158
	.dwcfi	undefined, 159
	.dwcfi	undefined, 160
	.dwcfi	undefined, 161
	.dwcfi	undefined, 162
	.dwcfi	undefined, 163
	.dwcfi	undefined, 164
	.dwcfi	undefined, 165
	.dwcfi	undefined, 166
	.dwcfi	undefined, 167
	.dwcfi	undefined, 168
	.dwcfi	undefined, 169
	.dwcfi	undefined, 170
	.dwcfi	undefined, 171
	.dwcfi	undefined, 172
	.dwcfi	undefined, 173
	.dwcfi	undefined, 174
	.dwcfi	undefined, 175
	.dwcfi	undefined, 176
	.dwcfi	undefined, 177
	.dwcfi	undefined, 178
	.dwcfi	undefined, 179
	.dwcfi	undefined, 180
	.dwcfi	undefined, 181
	.dwcfi	undefined, 182
	.dwcfi	undefined, 183
	.dwcfi	undefined, 184
	.dwcfi	undefined, 185
	.dwcfi	undefined, 186
	.dwcfi	undefined, 187
	.dwcfi	undefined, 188
	.dwcfi	undefined, 189
	.dwcfi	undefined, 190
	.dwcfi	undefined, 191
	.dwcfi	undefined, 192
	.dwcfi	undefined, 193
	.dwcfi	undefined, 194
	.dwcfi	undefined, 195
	.dwcfi	undefined, 196
	.dwcfi	undefined, 197
	.dwcfi	undefined, 198
	.dwcfi	undefined, 199
	.dwcfi	undefined, 200
	.dwcfi	undefined, 201
	.dwcfi	undefined, 202
	.dwcfi	undefined, 203
	.dwcfi	undefined, 204
	.dwcfi	undefined, 205
	.dwcfi	undefined, 206
	.dwcfi	undefined, 207
	.dwcfi	undefined, 208
	.dwcfi	undefined, 209
	.dwcfi	undefined, 210
	.dwcfi	undefined, 211
	.dwcfi	undefined, 212
	.dwcfi	undefined, 213
	.dwcfi	undefined, 214
	.dwcfi	undefined, 215
	.dwcfi	undefined, 216
	.dwcfi	undefined, 217
	.dwcfi	undefined, 218
	.dwcfi	undefined, 219
	.dwcfi	undefined, 220
	.dwcfi	undefined, 221
	.dwcfi	undefined, 222
	.dwcfi	undefined, 223
	.dwcfi	undefined, 224
	.dwcfi	undefined, 225
	.dwcfi	undefined, 226
	.dwcfi	undefined, 227
	.dwcfi	undefined, 228
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$30	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A0")
	.dwattr $C$DW$30, DW_AT_location[DW_OP_reg0]
$C$DW$31	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A1")
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg1]
$C$DW$32	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A2")
	.dwattr $C$DW$32, DW_AT_location[DW_OP_reg2]
$C$DW$33	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A3")
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg3]
$C$DW$34	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A4")
	.dwattr $C$DW$34, DW_AT_location[DW_OP_reg4]
$C$DW$35	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A5")
	.dwattr $C$DW$35, DW_AT_location[DW_OP_reg5]
$C$DW$36	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A6")
	.dwattr $C$DW$36, DW_AT_location[DW_OP_reg6]
$C$DW$37	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A7")
	.dwattr $C$DW$37, DW_AT_location[DW_OP_reg7]
$C$DW$38	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A8")
	.dwattr $C$DW$38, DW_AT_location[DW_OP_reg8]
$C$DW$39	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A9")
	.dwattr $C$DW$39, DW_AT_location[DW_OP_reg9]
$C$DW$40	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A10")
	.dwattr $C$DW$40, DW_AT_location[DW_OP_reg10]
$C$DW$41	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A11")
	.dwattr $C$DW$41, DW_AT_location[DW_OP_reg11]
$C$DW$42	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A12")
	.dwattr $C$DW$42, DW_AT_location[DW_OP_reg12]
$C$DW$43	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A13")
	.dwattr $C$DW$43, DW_AT_location[DW_OP_reg13]
$C$DW$44	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A14")
	.dwattr $C$DW$44, DW_AT_location[DW_OP_reg14]
$C$DW$45	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A15")
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg15]
$C$DW$46	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B0")
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg16]
$C$DW$47	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B1")
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg17]
$C$DW$48	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B2")
	.dwattr $C$DW$48, DW_AT_location[DW_OP_reg18]
$C$DW$49	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B3")
	.dwattr $C$DW$49, DW_AT_location[DW_OP_reg19]
$C$DW$50	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B4")
	.dwattr $C$DW$50, DW_AT_location[DW_OP_reg20]
$C$DW$51	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B5")
	.dwattr $C$DW$51, DW_AT_location[DW_OP_reg21]
$C$DW$52	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B6")
	.dwattr $C$DW$52, DW_AT_location[DW_OP_reg22]
$C$DW$53	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B7")
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg23]
$C$DW$54	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B8")
	.dwattr $C$DW$54, DW_AT_location[DW_OP_reg24]
$C$DW$55	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B9")
	.dwattr $C$DW$55, DW_AT_location[DW_OP_reg25]
$C$DW$56	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B10")
	.dwattr $C$DW$56, DW_AT_location[DW_OP_reg26]
$C$DW$57	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B11")
	.dwattr $C$DW$57, DW_AT_location[DW_OP_reg27]
$C$DW$58	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B12")
	.dwattr $C$DW$58, DW_AT_location[DW_OP_reg28]
$C$DW$59	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B13")
	.dwattr $C$DW$59, DW_AT_location[DW_OP_reg29]
$C$DW$60	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DP")
	.dwattr $C$DW$60, DW_AT_location[DW_OP_reg30]
$C$DW$61	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SP")
	.dwattr $C$DW$61, DW_AT_location[DW_OP_reg31]
$C$DW$62	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FP")
	.dwattr $C$DW$62, DW_AT_location[DW_OP_regx 0x20]
$C$DW$63	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC")
	.dwattr $C$DW$63, DW_AT_location[DW_OP_regx 0x21]
$C$DW$64	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IRP")
	.dwattr $C$DW$64, DW_AT_location[DW_OP_regx 0x22]
$C$DW$65	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IFR")
	.dwattr $C$DW$65, DW_AT_location[DW_OP_regx 0x23]
$C$DW$66	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NRP")
	.dwattr $C$DW$66, DW_AT_location[DW_OP_regx 0x24]
$C$DW$67	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A16")
	.dwattr $C$DW$67, DW_AT_location[DW_OP_regx 0x25]
$C$DW$68	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A17")
	.dwattr $C$DW$68, DW_AT_location[DW_OP_regx 0x26]
$C$DW$69	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A18")
	.dwattr $C$DW$69, DW_AT_location[DW_OP_regx 0x27]
$C$DW$70	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A19")
	.dwattr $C$DW$70, DW_AT_location[DW_OP_regx 0x28]
$C$DW$71	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A20")
	.dwattr $C$DW$71, DW_AT_location[DW_OP_regx 0x29]
$C$DW$72	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A21")
	.dwattr $C$DW$72, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$73	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A22")
	.dwattr $C$DW$73, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$74	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A23")
	.dwattr $C$DW$74, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$75	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A24")
	.dwattr $C$DW$75, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$76	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A25")
	.dwattr $C$DW$76, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$77	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A26")
	.dwattr $C$DW$77, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$78	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A27")
	.dwattr $C$DW$78, DW_AT_location[DW_OP_regx 0x30]
$C$DW$79	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A28")
	.dwattr $C$DW$79, DW_AT_location[DW_OP_regx 0x31]
$C$DW$80	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A29")
	.dwattr $C$DW$80, DW_AT_location[DW_OP_regx 0x32]
$C$DW$81	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A30")
	.dwattr $C$DW$81, DW_AT_location[DW_OP_regx 0x33]
$C$DW$82	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A31")
	.dwattr $C$DW$82, DW_AT_location[DW_OP_regx 0x34]
$C$DW$83	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B16")
	.dwattr $C$DW$83, DW_AT_location[DW_OP_regx 0x35]
$C$DW$84	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B17")
	.dwattr $C$DW$84, DW_AT_location[DW_OP_regx 0x36]
$C$DW$85	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B18")
	.dwattr $C$DW$85, DW_AT_location[DW_OP_regx 0x37]
$C$DW$86	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B19")
	.dwattr $C$DW$86, DW_AT_location[DW_OP_regx 0x38]
$C$DW$87	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B20")
	.dwattr $C$DW$87, DW_AT_location[DW_OP_regx 0x39]
$C$DW$88	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B21")
	.dwattr $C$DW$88, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$89	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B22")
	.dwattr $C$DW$89, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$90	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B23")
	.dwattr $C$DW$90, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$91	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B24")
	.dwattr $C$DW$91, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$92	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B25")
	.dwattr $C$DW$92, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$93	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B26")
	.dwattr $C$DW$93, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$94	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B27")
	.dwattr $C$DW$94, DW_AT_location[DW_OP_regx 0x40]
$C$DW$95	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B28")
	.dwattr $C$DW$95, DW_AT_location[DW_OP_regx 0x41]
$C$DW$96	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B29")
	.dwattr $C$DW$96, DW_AT_location[DW_OP_regx 0x42]
$C$DW$97	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B30")
	.dwattr $C$DW$97, DW_AT_location[DW_OP_regx 0x43]
$C$DW$98	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B31")
	.dwattr $C$DW$98, DW_AT_location[DW_OP_regx 0x44]
$C$DW$99	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("AMR")
	.dwattr $C$DW$99, DW_AT_location[DW_OP_regx 0x45]
$C$DW$100	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CSR")
	.dwattr $C$DW$100, DW_AT_location[DW_OP_regx 0x46]
$C$DW$101	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISR")
	.dwattr $C$DW$101, DW_AT_location[DW_OP_regx 0x47]
$C$DW$102	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ICR")
	.dwattr $C$DW$102, DW_AT_location[DW_OP_regx 0x48]
$C$DW$103	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IER")
	.dwattr $C$DW$103, DW_AT_location[DW_OP_regx 0x49]
$C$DW$104	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISTP")
	.dwattr $C$DW$104, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$105	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IN")
	.dwattr $C$DW$105, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$106	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OUT")
	.dwattr $C$DW$106, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$107	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ACR")
	.dwattr $C$DW$107, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$108	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ADR")
	.dwattr $C$DW$108, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$109	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FADCR")
	.dwattr $C$DW$109, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$110	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FAUCR")
	.dwattr $C$DW$110, DW_AT_location[DW_OP_regx 0x50]
$C$DW$111	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FMCR")
	.dwattr $C$DW$111, DW_AT_location[DW_OP_regx 0x51]
$C$DW$112	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GFPGFR")
	.dwattr $C$DW$112, DW_AT_location[DW_OP_regx 0x52]
$C$DW$113	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DIER")
	.dwattr $C$DW$113, DW_AT_location[DW_OP_regx 0x53]
$C$DW$114	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("REP")
	.dwattr $C$DW$114, DW_AT_location[DW_OP_regx 0x54]
$C$DW$115	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCL")
	.dwattr $C$DW$115, DW_AT_location[DW_OP_regx 0x55]
$C$DW$116	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCH")
	.dwattr $C$DW$116, DW_AT_location[DW_OP_regx 0x56]
$C$DW$117	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ARP")
	.dwattr $C$DW$117, DW_AT_location[DW_OP_regx 0x57]
$C$DW$118	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ILC")
	.dwattr $C$DW$118, DW_AT_location[DW_OP_regx 0x58]
$C$DW$119	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RILC")
	.dwattr $C$DW$119, DW_AT_location[DW_OP_regx 0x59]
$C$DW$120	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DNUM")
	.dwattr $C$DW$120, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$121	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SSR")
	.dwattr $C$DW$121, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$122	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYA")
	.dwattr $C$DW$122, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$123	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYB")
	.dwattr $C$DW$123, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$124	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSR")
	.dwattr $C$DW$124, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$125	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ITSR")
	.dwattr $C$DW$125, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$126	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NTSR")
	.dwattr $C$DW$126, DW_AT_location[DW_OP_regx 0x60]
$C$DW$127	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("EFR")
	.dwattr $C$DW$127, DW_AT_location[DW_OP_regx 0x61]
$C$DW$128	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ECR")
	.dwattr $C$DW$128, DW_AT_location[DW_OP_regx 0x62]
$C$DW$129	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IERR")
	.dwattr $C$DW$129, DW_AT_location[DW_OP_regx 0x63]
$C$DW$130	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DMSG")
	.dwattr $C$DW$130, DW_AT_location[DW_OP_regx 0x64]
$C$DW$131	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CMSG")
	.dwattr $C$DW$131, DW_AT_location[DW_OP_regx 0x65]
$C$DW$132	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_ADDR")
	.dwattr $C$DW$132, DW_AT_location[DW_OP_regx 0x66]
$C$DW$133	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_DATA")
	.dwattr $C$DW$133, DW_AT_location[DW_OP_regx 0x67]
$C$DW$134	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_CNTL")
	.dwattr $C$DW$134, DW_AT_location[DW_OP_regx 0x68]
$C$DW$135	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCU_CNTL")
	.dwattr $C$DW$135, DW_AT_location[DW_OP_regx 0x69]
$C$DW$136	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_REC_CNTL")
	.dwattr $C$DW$136, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$137	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_XMT_CNTL")
	.dwattr $C$DW$137, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$138	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_CFG")
	.dwattr $C$DW$138, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$139	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RDATA")
	.dwattr $C$DW$139, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$140	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WDATA")
	.dwattr $C$DW$140, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$141	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RADDR")
	.dwattr $C$DW$141, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$142	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WADDR")
	.dwattr $C$DW$142, DW_AT_location[DW_OP_regx 0x70]
$C$DW$143	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("MFREG0")
	.dwattr $C$DW$143, DW_AT_location[DW_OP_regx 0x71]
$C$DW$144	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DBG_STAT")
	.dwattr $C$DW$144, DW_AT_location[DW_OP_regx 0x72]
$C$DW$145	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("BRK_EN")
	.dwattr $C$DW$145, DW_AT_location[DW_OP_regx 0x73]
$C$DW$146	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0_CNT")
	.dwattr $C$DW$146, DW_AT_location[DW_OP_regx 0x74]
$C$DW$147	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0")
	.dwattr $C$DW$147, DW_AT_location[DW_OP_regx 0x75]
$C$DW$148	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP1")
	.dwattr $C$DW$148, DW_AT_location[DW_OP_regx 0x76]
$C$DW$149	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP2")
	.dwattr $C$DW$149, DW_AT_location[DW_OP_regx 0x77]
$C$DW$150	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP3")
	.dwattr $C$DW$150, DW_AT_location[DW_OP_regx 0x78]
$C$DW$151	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OVERLAY")
	.dwattr $C$DW$151, DW_AT_location[DW_OP_regx 0x79]
$C$DW$152	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC_PROF")
	.dwattr $C$DW$152, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$153	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ATSR")
	.dwattr $C$DW$153, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$154	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TRR")
	.dwattr $C$DW$154, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$155	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCRR")
	.dwattr $C$DW$155, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$156	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DESR")
	.dwattr $C$DW$156, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$157	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DETR")
	.dwattr $C$DW$157, DW_AT_location[DW_OP_regx 0x7f]
$C$DW$158	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$158, DW_AT_location[DW_OP_regx 0xe4]
	.dwendtag $C$DW$CU

