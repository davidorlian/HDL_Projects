`timescale 1ns / 1ps

module tb_cntr ();

reg tb_clk, tb_reset;
reg [7:0] tb_load;
wire [7:0] tb_count;
wire tb_tc;



initial begin        
  $display ("Counter 8 bit");
  $display ("time\t\tclk\treset\tcount\ttc");
  $monitor ("%8g\t\t%b\t%b\t%d\t%b", 
	  $time, tb_clk, tb_reset, tb_count, tb_tc);	
  tb_clk = 1;
  tb_load = 8'd20;
  tb_reset = 1;
  #70 tb_reset = 0;
  #5 tb_load = 8'd30;
  #500 tb_reset = 1;
  #10 tb_reset = 0;
  #300 tb_reset = 1;
  #10 tb_reset = 0; 
  #2000 $finish;      
end

always begin
  #5 tb_clk = ~tb_clk; 
end

// Connect DUT to test bench
cntr_8bit DUT 
(
  tb_clk,
  tb_reset,
  tb_load,
  tb_count,
  tb_tc
);

endmodule