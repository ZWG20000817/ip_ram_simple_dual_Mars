`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/04 10:27:35
// Design Name: 
// Module Name: karatsuba_top
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
// 1. top Arch and algorithm
// 2. mult
// 3. add
// 4. parameter
// 5. pipeline
// 6. tb
// 7. timming to meet 200MHz
// 8. auto testbench with random input
//////////////////////////////////////////////////////////////////////////////////


module karatsuba_top #(
    parameter   BIT_WIDTH = 128

    )(

    input                                   clk,
    input                                   rst,

    input                                   mult_in_en,
    input           [BIT_WIDTH-1:0]         mult_in_a,
    input           [BIT_WIDTH-1:0]         mult_in_b,

    output                                  mult_out_en,
    output  reg     [BIT_WIDTH*2-1:0]       mult_out

    );

parameter       PART_WIDTH = BIT_WIDTH/2;//PART_WIDTH
//Make sure NEXT_MULT_WIDTH is an even number
parameter       NEXT_MULT_WIDTH = (PART_WIDTH+1)%2 == 1 ?  PART_WIDTH+2 : PART_WIDTH+1;



wire    [PART_WIDTH-1:0]      kara_in_ah;
wire    [PART_WIDTH-1:0]      kara_in_al;
wire    [PART_WIDTH-1:0]      kara_in_bh;
wire    [PART_WIDTH-1:0]      kara_in_bl;

assign kara_in_ah = mult_in_a[BIT_WIDTH-1:PART_WIDTH];
assign kara_in_al = mult_in_a[PART_WIDTH-1:0];

assign kara_in_bh = mult_in_b[BIT_WIDTH-1:PART_WIDTH];
assign kara_in_bl = mult_in_b[PART_WIDTH-1:0];


reg     [PART_WIDTH-1:0]      kara_in_ah_1r;
reg     [PART_WIDTH-1:0]      kara_in_al_1r;
reg     [PART_WIDTH-1:0]      kara_in_bh_1r;
reg     [PART_WIDTH-1:0]      kara_in_bl_1r;

// delay to match sequence
always@ (posedge clk) begin
    if(rst) begin
        kara_in_ah_1r   <= 'd0;
        kara_in_al_1r   <= 'd0;
        kara_in_bh_1r   <= 'd0;
        kara_in_bl_1r   <= 'd0;
    end
    else begin
        kara_in_ah_1r   <= kara_in_ah;
        kara_in_al_1r   <= kara_in_al;
        kara_in_bh_1r   <= kara_in_bh;
        kara_in_bl_1r   <= kara_in_bl;
    end
end


reg     [PART_WIDTH:0]      sum_ah_al;
reg     [PART_WIDTH:0]      sum_bh_bl;

// compute ah+al and bh+bl
always@ (posedge clk) begin
    if(rst) begin
        sum_ah_al <= 'd0;
        sum_bh_bl <= 'd0;
    end
    else begin
        sum_ah_al <= kara_in_ah + kara_in_al;
        sum_bh_bl <= kara_in_bh + kara_in_bl;
    end
end


wire    [NEXT_MULT_WIDTH*2-1:0]      mult_ch_out;
wire    [NEXT_MULT_WIDTH*2-1:0]      mult_cl_out;
wire    [NEXT_MULT_WIDTH*2-1:0]      mult_cm_out;

// z2 = ah*bh
kara_mult_66bit #(
    .BIT_WIDTH      (NEXT_MULT_WIDTH)

) u_kara_mult_66bit_ch (
    .clk            (clk                    ),
    .rst            (rst                    ),
    .mult_in_a      ({2'b0,kara_in_ah_1r}   ),
    .mult_in_b      ({2'b0,kara_in_bh_1r}   ),

    .mult_out       (mult_ch_out            )

    );

// z0 = al*bl
kara_mult_66bit #(
    .BIT_WIDTH      (NEXT_MULT_WIDTH)

) u_kara_mult_66bit_cl (
    .clk            (clk                    ),
    .rst            (rst                    ),
    .mult_in_a      ({2'b0,kara_in_al_1r}   ),
    .mult_in_b      ({2'b0,kara_in_bl_1r}   ),

    .mult_out       (mult_cl_out            )

    );

// (ah+al) * (bh+bl)
kara_mult_66bit  #(
    .BIT_WIDTH      (NEXT_MULT_WIDTH)

) u_kara_mult_66bit_cm (
    .clk            (clk                    ),
    .rst            (rst                    ),
    .mult_in_a      ({1'b0,sum_ah_al}       ),
    .mult_in_b      ({1'b0,sum_bh_bl}       ),

    .mult_out       (mult_cm_out            )

    );



// delay to match sequence
reg                 [BIT_WIDTH-1:0]      mult_cl_out_1r;
reg                 [BIT_WIDTH-1:0]      mult_ch_out_1r;
reg                 [BIT_WIDTH-1:0]      mult_ch_out_2r;
reg                 [BIT_WIDTH-1:0]      mult_ch_out_3r;
always@ (posedge clk) begin
    if(rst) begin
        mult_cl_out_1r <= 'd0;
        mult_ch_out_1r <= 'd0;
        mult_ch_out_2r <= 'd0;
        mult_ch_out_3r <= 'd0;
    end
    else begin
        mult_cl_out_1r <= mult_cl_out;
        mult_ch_out_1r <= mult_ch_out;
        mult_ch_out_2r <= mult_ch_out_1r;
        mult_ch_out_3r <= mult_ch_out_2r;
    end
end

// z1 = (ah+al) * (bh+bl) - ah*bh - al*bl
reg     [(PART_WIDTH+1)*2+2-1:0]      sum_cm_ch_cl;
always@ (posedge clk) begin
    if(rst) begin
        sum_cm_ch_cl <= 'd0;
    end
    else begin
        sum_cm_ch_cl <= mult_cm_out - mult_cl_out - mult_ch_out;
    end
end

// delay to match sequence
reg     [(PART_WIDTH+1)*2+2-1:0]      sum_cm_ch_cl_1r;
always@ (posedge clk) begin
    if(rst) begin
        sum_cm_ch_cl_1r <= 'd0;
    end
    else begin
        sum_cm_ch_cl_1r <= sum_cm_ch_cl;
    end
end


//(lower half of z1) + (upper half of z0)
reg     [PART_WIDTH:0]      sum_clh_cml;
always@ (posedge clk) begin
    if(rst) begin
        sum_clh_cml <= 'd0;
    end
    else begin
        sum_clh_cml <= mult_cl_out_1r[BIT_WIDTH-1:PART_WIDTH] + sum_cm_ch_cl[PART_WIDTH-1:0];
    end
end

//(lower half of z2) + (upper half of z1) + (carry of sum_clh_cml)
reg     [PART_WIDTH+5:0]      sum_cmh_chl_carry;
always@ (posedge clk) begin
    if(rst) begin
        sum_cmh_chl_carry <= 'd0;
    end
    else begin
        sum_cmh_chl_carry <= sum_cm_ch_cl_1r[(PART_WIDTH+1)*2+2-1:PART_WIDTH] + mult_ch_out_2r[PART_WIDTH-1:0] + sum_clh_cml[PART_WIDTH];
    end
end

//(upper half of z2) + (carry of sum_cmh_chl_carry)
reg     [PART_WIDTH:0]      sum_chh_carry;
always@ (posedge clk) begin
    if(rst) begin
        sum_chh_carry <= 'd0;
    end
    else begin
        sum_chh_carry <= mult_ch_out_3r[BIT_WIDTH-1:PART_WIDTH] + sum_cmh_chl_carry[PART_WIDTH+5:PART_WIDTH];
    end
end

// delay to match sequence
reg     [PART_WIDTH-1:0]      sum_0_tmp;
reg     [PART_WIDTH-1:0]      sum_0_tmp_1r;
reg     [PART_WIDTH-1:0]      sum_0_tmp_2r;
always@ (posedge clk) begin
    if(rst) begin
        sum_0_tmp <= 'd0;
        sum_0_tmp_1r <= 'd0;
        sum_0_tmp_2r <= 'd0;
    end
    else begin
        sum_0_tmp <= mult_cl_out_1r[PART_WIDTH-1:0];
        sum_0_tmp_1r <= sum_0_tmp;
        sum_0_tmp_2r <= sum_0_tmp_1r;
    end
end

// delay to match sequence
reg     [PART_WIDTH-1:0]      sum_1_tmp;
reg     [PART_WIDTH-1:0]      sum_1_tmp_1r;
always@ (posedge clk) begin
    if(rst) begin
        sum_1_tmp <= 'd0;
        sum_1_tmp_1r <= 'd0;
    end
    else begin
        sum_1_tmp <= sum_clh_cml[PART_WIDTH-1:0];
        sum_1_tmp_1r <= sum_1_tmp;
    end
end

// delay to match sequence
reg     [PART_WIDTH-1:0]      sum_2_tmp;
always@ (posedge clk) begin
    if(rst) begin
        sum_2_tmp <= 'd0;
    end
    else begin
        sum_2_tmp <= sum_cmh_chl_carry[PART_WIDTH-1:0];
    end
end


srl_lut  #(
    .WID_DATA                   (1      ),
    .DLY_NUM                    (21     )
) u_srl_mult_out_en (
    .clk                        (clk            ),
    .d                          (mult_in_en     ),
    .q                          (mult_out_en    ) 
    );

//output
always@ (posedge clk) begin
    mult_out <= {sum_chh_carry[PART_WIDTH-1:0], sum_2_tmp, sum_1_tmp_1r, sum_0_tmp_2r};
end

endmodule
