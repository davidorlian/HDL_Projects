`timescale 1ns / 1ps

module tb_decoder_2to4 ();

    reg  tb_enable;
    reg  [1:0] tb_in;
    wire [3:0] tb_out;

    decoder_2to4 DUT (
        .enable(tb_enable),
        .in(tb_in),
        .out(tb_out)
    );

    integer i; // Declare loop variables
    integer j;

    initial begin

        $display("Time\tEnable\tInput\tOutput");

        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                tb_enable = i;
                tb_in = j;
                #10
                $display("%0t\t%b\t%b\t%b", $time, tb_enable, tb_in, tb_out);
            end
        end
        #10
        $finish;
    end

endmodule