`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/31 09:12:54
// Design Name: 
// Module Name: kara_mult_ram_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module kara_mult_ram_top(

    input               clk                 ,
    input               rst                 ,
    input               mult_ram_in_en      ,
    input   [255:0]     mult_ram_in         ,

    output              mult_ram_out_en     ,
    output  [255:0]     mult_ram_out        


    );

//*****************************************************
//**                    main code
//*****************************************************



reg             in_ram_rd_mode;
reg    [5:0]    in_ram_rw_cnt ;
always @(posedge clk ) begin
    if(rst == 1'b1)
        in_ram_rd_mode <= 1'b0;
    else if(mult_ram_in_en && in_ram_rw_cnt == 6'd63)
        in_ram_rd_mode <= 1'b1;
    else if(in_ram_rd_mode && in_ram_rw_cnt == 6'd63)
        in_ram_rd_mode <= 1'b0;
end

always @(posedge clk ) begin
    if(rst == 1'b1)
        in_ram_rw_cnt <= 6'd0;
    else if(mult_ram_in_en && in_ram_rw_cnt == 6'd63)
        in_ram_rw_cnt <= 6'd0;  
    else if((mult_ram_in_en && in_ram_rw_cnt < 6'd63) || in_ram_rd_mode)
        in_ram_rw_cnt <= in_ram_rw_cnt + 6'd1;   
end

//设置RAM写数�?
reg     [255:0]     in_ram_wr_data;
always @(posedge clk ) begin
    in_ram_wr_data   <= mult_ram_in;
end    

//设置RAM读写选择信号
reg                 in_ram_wr_H_rd_L;
reg     [5:0]       in_ram_addr;
reg                 out_ram_wr_H_rd_L;
reg     [5:0]       out_ram_addr;
always @(posedge clk ) begin
    if(rst == 1'b1)
        in_ram_wr_H_rd_L <= 1'b1;
    else if(in_ram_wr_H_rd_L && in_ram_addr == 6'd63)
        in_ram_wr_H_rd_L <= 1'b0;
    else if(~in_ram_wr_H_rd_L && in_ram_addr == 6'd63)                      
        in_ram_wr_H_rd_L <= 1'b1;   
end    

//设置RAM读写地址

always @(posedge clk ) begin
    if(rst == 1'b1)
        in_ram_addr <= 5'd0;
    else
        in_ram_addr <= in_ram_rw_cnt;
end 


reg                 in_ram_rd_data_en_tmp;
always @(posedge clk ) begin
    if(rst == 1'b1)
        in_ram_rd_data_en_tmp <= 1'b0;
    else if(~in_ram_wr_H_rd_L && in_ram_addr == 6'd63)
        in_ram_rd_data_en_tmp <= 1'b0;
    else if(in_ram_wr_H_rd_L && in_ram_addr == 6'd63)
        in_ram_rd_data_en_tmp <= 1'b1;
end 


srl_lut  #(
    .WID_DATA                   (1     ),
    .DLY_NUM                    (2     )
) u_srl_in_ram_rd_data_en (
    .clk                        (clk                            ),
    .d                          (in_ram_rd_data_en_tmp          ),
    .q                          (in_ram_rd_data_en              ) 
    );


//ram ip�?
wire    [255:0]     in_ram_rd_data;
reg     [255:0]     in_ram_rd_data_reg;

wire                mult_out_en;
wire    [255:0]     mult_out;

karatsuba_top #(
    .BIT_WIDTH      (128)

) u_karatsuba_top (

    .clk                (clk                        ),
    .rst                (rst                        ),
    .mult_in_en         (in_ram_rd_data_en          ),
    .mult_in_a          (in_ram_rd_data[127:0]      ),
    .mult_in_b          (in_ram_rd_data[255:128]    ),
    .mult_out_en        (mult_out_en                ),
    .mult_out           (mult_out                   )
);

reg             out_ram_rd_mode;
reg    [5:0]    out_ram_rw_cnt ;
always @(posedge clk ) begin
    if(rst == 1'b1)
        out_ram_rd_mode <= 1'b0;
    else if(mult_out_en && out_ram_rw_cnt == 6'd63)
        out_ram_rd_mode <= 1'b1;
    else if(out_ram_rd_mode && out_ram_rw_cnt == 6'd63)
        out_ram_rd_mode <= 1'b0;
end

always @(posedge clk ) begin
    if(rst == 1'b1)
        out_ram_rw_cnt <= 6'd0;
    else if(out_ram_rw_cnt == 6'd63)
        out_ram_rw_cnt <= 6'd0;  
    else if((mult_out_en && out_ram_rw_cnt < 6'd63) || out_ram_rd_mode)
        begin
            out_ram_rw_cnt <= out_ram_rw_cnt + 6'd1;  
        end 
end

//设置RAM写数�?
reg     [255:0]     out_ram_wr_data;
always @(posedge clk ) begin
    out_ram_wr_data   <= mult_out;   
end    

//设置RAM读写选择信号

always @(posedge clk ) begin
    if(rst == 1'b1)
        out_ram_wr_H_rd_L <= 1'b1;
    else if(out_ram_wr_H_rd_L && out_ram_addr == 6'd63)
        out_ram_wr_H_rd_L <= 1'b0;
    else if(~out_ram_wr_H_rd_L && out_ram_addr == 6'd63)                      
        out_ram_wr_H_rd_L <= 1'b1;   
end

//设置RAM读写地址

always @(posedge clk ) begin
    if(rst == 1'b1)
        out_ram_addr <= 5'd0;
    else
        out_ram_addr <= out_ram_rw_cnt;
end 

reg                 out_ram_rd_data_en_tmp;
always @(posedge clk ) begin
    if(rst == 1'b1)
        out_ram_rd_data_en_tmp <= 1'b0;
    else if(~out_ram_wr_H_rd_L && out_ram_addr == 6'd63)
        out_ram_rd_data_en_tmp <= 1'b0;
    else if(out_ram_wr_H_rd_L && out_ram_addr == 6'd63)
        out_ram_rd_data_en_tmp <= 1'b1;
end 

reg    mult_wr;
reg    mult_rd;

always @(posedge clk ) begin
    if(rst == 1'b1)
        mult_wr <= 1'b0;
    else if(mult_wr == 1'b0 && in_ram_addr == 6'd63)
        mult_wr <= 1'b1;
    else if(mult_wr == 1'b1 && out_ram_addr == 6'd63)
        mult_wr <= 1'b0;
    else
        mult_wr <= mult_wr;
end
reg               wr_H_rd_L;
reg    [255:0]    ram_wr_data;
reg    [5:0]      ram_wr_addr;
always @(posedge clk ) begin
    if(rst == 1'b1) begin
        wr_H_rd_L   <= 1'd0; 
        ram_wr_data <= 255'd0;
        ram_wr_addr <= 6'd0;
    end
        else if(mult_wr == 1'b0) begin
        wr_H_rd_L   <= in_ram_wr_H_rd_L; 
        ram_wr_data <= in_ram_wr_data;
        ram_wr_addr <= in_ram_addr;
    end    
    else if(mult_wr == 1'b1) begin
        wr_H_rd_L   <= out_ram_wr_H_rd_L; 
        ram_wr_data <= out_ram_wr_data;
        ram_wr_addr <= out_ram_addr;
    end
end

wire    [255:0]    ram_rd_data;
reg     [5:0]      ram_rd_addr;
reg     [5:0]      ram_rd_addr_1r;
reg     [5:0]      ram_rd_addr_2r;
always @(posedge clk ) begin
    if(rst == 1'b1)
        ram_rd_addr_1r <= 6'd0;
    else if(ram_wr_addr == 6'd5) 
        ram_rd_addr_1r <= ram_rd_addr_1r + 6'd1;
    else if(ram_rd_addr_1r != 6'd0)
        ram_rd_addr_1r <= ram_rd_addr_1r + 6'd1;
    else if(ram_rd_addr_1r == 6'd63)
        ram_rd_addr_1r <= 6'd0;
end
always @(posedge clk ) begin
    if(rst == 1'b1)begin
        ram_rd_addr <= 6'd0;
        ram_rd_addr_1r <= 6'd0;
        ram_rd_addr_2r <= 6'd0;
    end
    else begin
        ram_rd_addr_2r <= ram_rd_addr_1r;
        ram_rd_addr    <= ram_rd_addr_2r;
    end
end

reg    [255:0]    mult_ram_out_reg;

assign    mult_ram_out   = mult_ram_out_reg;
assign    in_ram_rd_data = in_ram_rd_data_reg;

always @(posedge clk ) begin
    if(mult_rd == 1'b0)
        in_ram_rd_data_reg <= ram_rd_data;    
    else if(mult_rd == 1'b1) 
        mult_ram_out_reg <= ram_rd_data;
end
always @(posedge clk ) begin
    if(rst == 1'b1)
        mult_rd <= 1'b0;
    else if(mult_rd == 1'b0 && ram_rd_addr == 6'd63)
        mult_rd <= 1'b1;
    else if(mult_rd == 1'b1 && ram_rd_addr == 6'd63)
        mult_rd <= 1'b0;
    else
        mult_rd <= mult_rd;
end

srl_lut  #(
    .WID_DATA                   (1      ),
    .DLY_NUM                    (2     )
) u_srl_mult_ram_out_en (
    .clk                        (clk                        ),
    .d                          (out_ram_rd_data_en_tmp     ),
    .q                          (mult_ram_out_en            ) 
    );

//ram ip�?
ram_dual m_mult_dual (
    .clka  (clk                 ),  // input wire clka
    .ena   (1'b1                ),  // input wire ena
    .wea   (wr_H_rd_L           ),  // input wire [0 : 0] wea
    .addra (ram_wr_addr         ),  // input wire [5 : 0] addra
    .dina  (ram_wr_data         ),  // input wire [255 : 0] dina
    .clkb  (clk                 ),  // input wire clkb
    .enb   (1'b1                ),  // input wire enb
    .addrb (ram_rd_addr_1r      ),  // input wire [5 : 0] addrb
    .doutb (ram_rd_data         )   // output wire [255 : 0] doutb
);
/*mult_ram  u_mult_in_ram (
    .clka  (clk                 ),  // input wire clka
    .ena   (1'b1                ),  // input wire ena    
    .wea   (in_ram_wr_H_rd_L    ),  // input wire [0 : 0] wea
    .addra (in_ram_addr         ),  // input wire [5 : 0] addra
    .dina  (in_ram_wr_data      ),  // input wire [255 : 0] dina
    .douta (in_ram_rd_data      )   // output wire [255 : 0] douta
);
mult_ram  u_mult_out_ram (
    .clka  (clk                 ),  // input wire clka
    .ena   (1'b1                ),  // input wire ena    
    .wea   (out_ram_wr_H_rd_L   ),  // input wire [0 : 0] wea
    .addra (out_ram_addr        ),  // input wire [5 : 0] addra
    .dina  (out_ram_wr_data     ),  // input wire [255 : 0] dina
    .douta (mult_ram_out        )   // output wire [255 : 0] douta
);*/

endmodule
