`timescale 1ns / 1ps

module register_8bit_tb();

    reg  CLK_tb;
    reg  RST_tb;
    reg  lode_tb;
    reg  [7:0] data_in_tb;
    wire [7:0] data_out_tb;
 
    register_8bit UUT(
        .CLK(CLK_tb),
        .RST(RST_tb),
        .lode(lode_tb),
        .data_in(data_in_tb),
        .data_out(data_out_tb)
    );

    initial begin
        CLK_tb = 0;
        forever #5 CLK_tb = ~CLK_tb;
    end

    initial begin
        RST_tb =0;
        lode_tb = 0;
        data_in_tb = 0;
        #17 RST_tb = 1;
        #5 RST_tb = 0;
        #10 lode_tb = 1;
        #10 data_in_tb = 8'hff;
        #10 lode_tb = 0;
        #10 data_in_tb = 8'h00;
        #10 lode_tb = 1;
        #10 data_in_tb = 8'h55;
        #10 lode_tb = 0;
        #10 data_in_tb = 8'haa;
        #10 lode_tb = 1;
        #10 data_in_tb = 8'h00;
        #10 lode_tb = 0;
        #10 data_in_tb = 8'hff;
        #10 lode_tb = 1;
        #10 data_in_tb = 8'haa;
    end
    
endmodule