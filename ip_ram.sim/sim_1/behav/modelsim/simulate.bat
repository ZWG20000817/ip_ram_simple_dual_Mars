@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Mentor Graphics ModelSim Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Sep 16 00:41:19 +0800 2020
REM SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
set bin_path=D:\program\ModelSim\win64
call %bin_path%/vsim   -do "do {tb_kara_mult_ram_simulate.do}" -l simulate.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
