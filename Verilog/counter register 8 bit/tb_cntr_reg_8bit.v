`timescale 1ns / 1ps

module tb_cntr_reg_8bit ();

  reg tb_clk;
  reg tb_rst;
  reg tb_load;
  reg tb_re_load;
  reg [7:0] tb_data_in;
  wire [7:0] tb_data_out;
  wire tb_tc;

  cntr_reg_8bit DUT (
    .clk(tb_clk),
    .rst(tb_rst),
    .load(tb_load),
    .re_load(tb_re_load),
    .data_in(tb_data_in),
    .data_out(tb_data_out),
    .tc(tb_tc)
  );

  initial begin
    tb_clk = 1;
    tb_rst = 1;
    tb_load = 0;
    tb_re_load =0;
    tb_data_in = 8'b0;

    $display("Time\t\tclock\treset\tload\treload\tdata_in\tdata_out");
    $monitor("%0t\t\t%b\t%b\t%b\t%b\t%d\t%d",$time, tb_clk, tb_rst, tb_load, tb_re_load, tb_data_in, tb_data_out);
    #14 tb_rst = 0;
    tb_data_in = 8'hf;
    #10 tb_load = 1;
    #10 tb_load = 0;
    #50 tb_re_load = 1;
    #10 tb_re_load = 0;
    #10 tb_data_in = 8'hff;
    #10 tb_load = 1;
    #10 tb_load = 0;
    #20 tb_rst = 1;
    #10 tb_rst = 0;
    #40 tb_re_load = 1;
    #10 tb_re_load = 0;
    #400
    $finish;
  end

  always #5 tb_clk = ~tb_clk;



endmodule