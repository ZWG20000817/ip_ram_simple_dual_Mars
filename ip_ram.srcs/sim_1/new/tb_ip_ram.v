`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/08 15:25:39
// Design Name: 
// Module Name: tb_ip_ram
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


module tb_ip_ram( );
    // Inputs
    reg sys_clk;
    reg sys_rst_n;
    
    // Instantiate the Unit Under Test (UUT)
    ip_ram  uut (
        .sys_clk         (sys_clk), 
        .sys_rst_n       (sys_rst_n)
    );
    
    //Genarate the clk
    parameter PERIOD = 20;
    always begin
        sys_clk = 1'b0;
        #(PERIOD/2) sys_clk = 1'b1;
        #(PERIOD/2);
    end   
   
    initial begin
        // Initialize Inputs
        sys_rst_n = 0;
        // Wait 100 ns for global reset to finish
        #100  ;
        sys_rst_n = 1;
        // Add stimulus here
        
    end

endmodule
