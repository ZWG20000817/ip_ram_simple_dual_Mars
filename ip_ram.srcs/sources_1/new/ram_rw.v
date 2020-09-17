//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           ram_rw
// Last modified Date:  2019/05/08 8:41:06
// Last Version:        V1.0
// Descriptions:       
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2019/05/08 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module ram_rw(
    input               clk        ,  //ʱ���ź�
    input               rst_n      ,  //��λ�źţ��͵�ƽ��Ч
    
	output  reg         ram_en ,          //ramʹ���ź�
	output  reg         ram_wr_H_rd_L  ,  //ram��дѡ��
    output  reg  [4:0]  ram_addr ,        //ram��д��ַ
    output  reg  [7:0]  ram_wr_data ,     //ramд����
    input        [7:0]  ram_rd_data       //ram������        
    );

//reg define
reg    [5:0]  rw_cnt ;                //��д���Ƽ�����

//*****************************************************
//**                    main code
//*****************************************************

//����RAMʹ���ź�
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        ram_en <= 1'b0;
    else
        ram_en <= 1'b1;
end 

//��д���Ƽ�����,��������Χ0~63
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        rw_cnt <= 6'd0;    
    else if(rw_cnt == 6'd63)
        rw_cnt <= 6'd0;
    else
        rw_cnt <= rw_cnt + 6'd1;    
end

//����RAMд����
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        ram_wr_data   <= 8'd0;  
    else if( (rw_cnt <= 6'd31) && ram_en  )  //�ڼ�������0-31��Χ�ڣ���д����
                                             //д���ݵ�ֵ���ϼ�1
        ram_wr_data   <= ram_wr_data + 8'd1;
    else
        ram_wr_data   <= ram_wr_data ;   
end    

//����RAM��дѡ���ź�
always @(posedge clk ) begin
    if(rst_n == 1'b0)
		ram_wr_H_rd_L <= 1'b1 ;
    else if( rw_cnt <= 6'd31 )	//�ڼ�������0-31��Χ�ڣ���д����
		ram_wr_H_rd_L <= 1'b1 ;
    else	                   //�ڼ�������32-63��Χ�ڣ��Ƕ�����
		ram_wr_H_rd_L <= 1'b0 ;   
end    

//����RAM��д��ַ
always @(posedge clk ) begin
    if(rst_n == 1'b0)
        ram_addr <= 5'd0;
    else
        ram_addr <= rw_cnt[4:0];  //��ֱַ��ȡ�������ĵ�5λ
end 

//����ILA
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