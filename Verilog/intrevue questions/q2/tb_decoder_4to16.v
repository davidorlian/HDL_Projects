`timescale 1ns / 1ps

module tb_decoder_4to16 ();

    reg tb_enable;
    reg [3:0] tb_in;
    wire [15:0] tb_out;

    decoder_4to16 DUT (
        .enable(tb_enable),
        .in(tb_in),
        .out(tb_out)
    );

    integer i, j;

        initial begin
            $display("time\tenable\tinput\toutput");

            for (i = 0; i <= 15; i = i + 1) begin
                for (j = 0; j <= 2; j = j + 1) begin
                    tb_enable = j;
                    tb_in = i;
                    #10
                    $display("%0t\t%b\t%b\t%b", $time, tb_enable, tb_in, tb_out);
                end
            end
            #10
            $finish;
        end

endmodule