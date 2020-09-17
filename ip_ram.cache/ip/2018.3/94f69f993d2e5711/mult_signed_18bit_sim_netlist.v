// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Aug 31 10:56:54 2020
// Host        : SC-201910041714 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_signed_18bit_sim_netlist.v
// Design      : mult_signed_18bit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_signed_18bit,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14_viv i_mult
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
jVtCOYy7gqogQo0+noCdKF2IsObsimVaXQdsGjNeYlKoL/ujZuCj/GMoj0vpps7noRB/926bGffA
rSHNN+pm9lk9YV8kFiOyFAG8A8YZs77Ah9Fw7oXOAKIvNDtd+9lcm1tlmsweqp9XRdjFzBQpihjt
u92B0sYoep5Q7BKfjv12sM8mCr9doSKx0JQ+XZL1iVbl7BMerWs6Ev2kGa4kK408/qNVqvM3gnVd
QesZM4Ah8O9SmNjH1AeuE8K7zjEhUcByR+5ApKxySEyqc+6iZAkcUY9fJG62ZYl0xyPRwBafAr+6
pmRk/B9eC8WimJbK7SpnV2adxzSO4N4jtiCj4g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sviTXd+4WTbrt0XMwM0KfGR1zXWbhspwzGi2dbDSpCHFJb9jTePSswL2ag4yS95ao+0FFspWM0cL
aHWJgD27OLzr71AmND2kBDLwqOqDte2XJQUg/p1gI1PBDhW5ILQXaC8KxBiyu0i5rXfnpkrx4zgt
B0N6kV7YGkWFMUur8lSsQ57s3Kry92L42rcVp6GunL1GAEHTOpWyR5NvDDCK5sL97fiSHKjMA2En
aJcBDb5g/KWlEwsfJrTitpP117vc0IFCWTtJtYQmFFZY8eYjxGrwM0sirRLrpEyj4tGXEuEBpi8z
6R0qRiHZp7qu3SVBbevYZUP8O6k1FsfQRd9yQQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7184)
`pragma protect data_block
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
kfM=
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
