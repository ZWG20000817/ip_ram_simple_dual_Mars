//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           ram_rw
// Last modified Date:  2019/05/08 8:41:06
// Last Version:        V1.0
// Descriptions:       
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2019/05/08 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module ram_rw(
    input               clk        ,  //时钟信号
    input               rst_n      ,  //复位信号，低电平有效
    
	output  reg         ram_en ,          //ram使能信号
	output  reg         ram_wr_H_rd_L  ,  //ram读写选择
    output  reg  [4:0]  ram_addr ,        //ram读写地址
    output  reg  [7:0]  ram_wr_data ,     //ram写数据
    input        [7:0]  ram_rd_data       //ram读数据        
    );

//reg define
reg    [5:0]  rw_cnt ;                //读写控制计数器

//*****************************************************
//**                    main code
//*****************************************************

//设置RAM使能信号
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        ram_en <= 1'b0;
    else
        ram_en <= 1'b1;
end 

//读写控制计数器,计数器范围0~63
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        rw_cnt <= 6'd0;    
    else if(rw_cnt == 6'd63)
        rw_cnt <= 6'd0;
    else
        rw_cnt <= rw_cnt + 6'd1;    
end

//设置RAM写数据
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        ram_wr_data   <= 8'd0;  
    else if( (rw_cnt <= 6'd31) && ram_en  )  //在计数器的0-31范围内，是写操作
                                             //写数据的值不断加1
        ram_wr_data   <= ram_wr_data + 8'd1;
    else
        ram_wr_data   <= ram_wr_data ;   
end    

//设置RAM读写选择信号
always @(posedge clk ) begin
    if(rst_n == 1'b0)
		ram_wr_H_rd_L <= 1'b1 ;
    else if( rw_cnt <= 6'd31 )	//在计数器的0-31范围内，是写操作
		ram_wr_H_rd_L <= 1'b1 ;
    else	                   //在计数器的32-63范围内，是读操作
		ram_wr_H_rd_L <= 1'b0 ;   
end    

//设置RAM读写地址
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        ram_addr <= 5'd0;
    else
        ram_addr <= rw_cnt[4:0];  //地址直接取计数器的低5位
end 

//例化ILA
ila_0  ila_0 (
	.clk(clk), // input wire clk

	.probe0(ram_en),        // input wire [0:0]  probe0  
	.probe1(ram_wr_H_rd_L), // input wire [0:0]  probe1 
	.probe2(rw_cnt),        // input wire [5:0]  probe2 
	.probe3(ram_addr),      // input wire [4:0]  probe3 
	.probe4(ram_wr_data),   // input wire [7:0]  probe4 
	.probe5(ram_rd_data)    // input wire [7:0]  probe5
);

endmodule