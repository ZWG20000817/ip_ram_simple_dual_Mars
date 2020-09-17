`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/31 10:39:50
// Design Name: 
// Module Name: tb_kara_mult_ram
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


module tb_kara_mult_ram(

    );



reg     sys_clk;
reg     sys_rst;

reg                     mult_ram_in_en;
reg     [255:0]         mult_ram_in;
wire                    mult_ram_out_en;
wire    [255:0]         mult_ram_out;


always #5 sys_clk = ~sys_clk;

integer i;

initial begin
    sys_clk = 1'b0;
    sys_rst = 1'b0;
    mult_ram_in_en = 1'b0;

    #10
    sys_rst = 1'b1;

    
    repeat (10) @ (posedge sys_clk);
    sys_rst <= 1'b0;

    for (i = 0; i < 64; i = i + 1) begin
        @(posedge sys_clk) begin
            mult_ram_in_en <= 1'b1;
            mult_ram_in <= {$random(),$random(),$random(),$random(),$random(),$random(),$random(),$random()};//{8{$random()}}
        end
    end

    @(posedge sys_clk)
        mult_ram_in_en <= 1'b0;

    repeat (200) @ (posedge sys_clk);

    for (i = 0; i < 64; i = i + 1) begin
        @(posedge sys_clk) begin
            mult_ram_in_en <= 1'b1;
            mult_ram_in <= {$random(),$random(),$random(),$random(),$random(),$random(),$random(),$random()};
        end
    end

    @(posedge sys_clk)
        mult_ram_in_en <= 1'b0;

end


kara_mult_ram_top uut_kara_mult_ram_top (

    .clk                (sys_clk            ),     
    .rst                (sys_rst            ),     
    .mult_ram_in_en     (mult_ram_in_en     ),     
    .mult_ram_in        (mult_ram_in        ),     
    .mult_ram_out_en    (mult_ram_out_en    ),     
    .mult_ram_out       (mult_ram_out       )


    );
endmodule
