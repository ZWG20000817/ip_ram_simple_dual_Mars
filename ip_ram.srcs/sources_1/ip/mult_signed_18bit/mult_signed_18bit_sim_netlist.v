// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Aug 31 10:56:55 2020
// Host        : SC-201910041714 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/work/ESLAS_prj/LAB_BRAM/ip_ram/ip_ram.srcs/sources_1/ip/mult_signed_18bit/mult_signed_18bit_sim_netlist.v
// Design      : mult_signed_18bit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_signed_18bit,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mult_signed_18bit
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [35:0]P;

  wire [17:0]A;
  wire [17:0]B;
  wire CLK;
  wire [35:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "35" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_signed_18bit_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "18" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "35" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_signed_18bit_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [17:0]A;
  input [17:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [35:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [17:0]A;
  wire [17:0]B;
  wire CLK;
  wire [35:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "35" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_signed_18bit_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
g7azmhtm6FcP7uNFjuXJjN8Z6yccOPk3SSjzvKB27peFKmnPmQmov5+YTGwYqqN9LpdyiUExk8K6
vPnJqontvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MFrqn2K0Cr7TmQ5al162oDGiY83d+AkTWOgFyXPYrTNznygR/tx44RAp24ytphNK9p6shs2EFMg/
Qqz0l8DCWiVEoJ/T8vMpnAn7Y+poGVGS1qAR3qE2njrl81VcGBZJeFaWIudhfr/DLTuuf2T/dWDU
YpelM3KbfYNPPiPy8PU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FZca5XZouG+/BYoQ8qrJTmnJanku4IprIWRkO6VciHehE5WehR0wsZJhfKlqLEeY1oTPA4bXaxmY
NjYkrop4EOwW8t47/hj2kFLI1OKUAE/TAhCGg/aNSOViUbB3dUomG/y+TBuDt9L6g0Arj1vb/5Pt
IChc5ZdEfRr1lJMTpFfP+5qmEH6lePPdzgPZATPB4Zrj0P6EyiEsU1FKBuAKd9iYNGiLCxVomaz0
3/RwK2Nl+/l4mc7PJt5Hso+4s1qHb4s2wD+OgbIwdH26ZkEnKVFpaLiuWQKu9uhDLGnsBMPf7XDE
p29f+mrvP9Zi/3nonA2aBKrTwR7XuH+ZYoakxA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jP68OjlYJglq3zpmKrXOhq7Sex8XNW8fQKp4hUNmuw06OOoKhQASNTnjtyVjAIk/VXb64ViBu1ds
cNMJybDSWBhnChfJq4h9PNybShGJXxSm3NDOo5wUHKf10Eti3fSotB9rVks+tNdTEZo4O97kgfdD
G1FNOqlsYcQiShEGLLiEQ2yYtgJBxJ+jc8mFjIEfPhAYy1ElrvtFEpnhkNS2LfE7xdWOQdO/XoKK
ibeY08pgncTI3pvO6TMbXushf0AX2S7hgfk8ysZrT+0gktqFrJnyR6oljS6VVPLtRNW2vo/cC8XQ
Bzvwwt4cpSo5KLS4XxB6qClZipItck2AUEdIbQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o7jAZIoXlFbFtDYmtXhfRBlb07dhBb6Wp03mlT4T0FXtvccSHWhWZgc+VUNwt6TohLihOwvSipPP
XVXpGL4pUVYNdQBCVpFzhMkt6jhyUgsF5t10yI5Of6YEfQrDHigceoBukM3+/zJHPprrPQE6FUvC
wXSGhBCXnHJs1R+n4l0714w8/WftPQhlD9QGQp1qT2VARQXUKBRxcRjxe9TcLfs0P4xnN7uHu0R6
JTmV+MHmhGpetSZGx+B2Wa1MQofUPURqwE70IwBoUhdXH8+39DT5I6x2+wMY6RcVATnhNd2BCgPd
RzAhwfrcqRiU9aB+eNNdFR8ve9M2nGMmV2JxZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Cl1Dz+fZIDYEIQuUd0pSg+5jknmtX/JERd+yOZ2SRaVra/4pU/eCTjEXMzhz4VFGYB6dgUxMsGBk
nL2WNdn/uaSPpi6mNF0UHQvZik4pUkYPrnRbFveVqW8i1t95SG0RW96uD19206lWrp5U1lqc4fH7
sfKHi8ZpU3MAg0DOO0E=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qqp76m2aV9ue8Qai7QUavb+lhRYdu/txrnwYLzwTe0vS0S2OD1vxr8VeIT3bF/ZuXlTGm4S/UCSF
bgOPp7VqEOeGNfsSPK+VpQ+foQMENCQYccwKquBDSg/sLjpPK9uuoGLBLxjw2OwsRzplVFXiPcRN
LYK1/FmCP7RJBNgmhh/ti99a+WSl6i2YIIRGocNplQlG8FXq8ZTTHd/x2Gtdf/zGvJOy/fNsos6S
Oq9yJ0rMmbGeWbri5c04gZM08pUmXBsivgOHm2IVEZZFM4SBqrsi0xa52hs2kelc3iKJcWiTvU3X
0fJP9qNFuIjXBPPZvEYwhVtIh6DwiIC2viSscQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W1etF5ANOxstf8oW+H2iJpEvtcm8wlX3DyQc1MhPt1RYmoP6cr/FU3EFIHB63fcKcv/SFDR6fYQS
SnW8DPVRHmLWOeMqV58et3TZVAorSfKmgpRssEe4DSEepjjfQDZnbippQ4+8ipRFJ7sEOEuf7agT
Zm15py4ICbrps9afIc3vekotWPTgkABV35YcXkrdDG2p9/oElmtptX+CpnzOg0Q8RHyOdwk2Vhiu
6kpjq5I9i/8sGHV4M0RiTOUrYLpYfKd//RsXvCXhq6z6IXaS3u4q3OGGedzAGaWGOB4OIKMpDC6J
iifMGrBMXVKHsjH+qjzaaUvHkaN5EJTfoJ0plA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
0AkRXpNEEHsiTcgtbjLSH0z1SlwhaLi6+lRmzxhOK4xSqXxUmLeD6LgjIfrA7NRwysKAjaQ0IdD4
U2ZJE+jflyZOQHOmxDR0XG/bNUpNfp6s6x5Js8gAdIA2IMWabeH3R74U/uGdnwN4zeOS3+4K4UwE
lDC6aXEBjiRga188NATtUTZEOd1jlM/VEDTpQaQveiA8bWWeV7bhlky+AyM5/AUl/LxnNwSSIWSS
ztzPlLmEkSnjnJlRp6MOtVYsSf72CnHRnjpCOtyUCeOo2sox56Ee4kVvWGMkzONtFWVZa4igGJfR
etQhTago/ZlTBWLk4DL8ZLtG7VS8kyTLTkP0dw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7184)
`pragma protect data_block
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
fhc=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
