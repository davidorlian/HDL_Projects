`timescale 1ns / 1ps

module tb_cntr ();

reg tb_clk, tb_reset;
wire tb_tc;



initial begin        
  $display ("Counter 8 bit");
  $display ("time\t\tclk\treset\tcont\ttc");
  $monitor ("%8g\t\t%b\t%b\t%d\t%b", 
	  $time, tb_clk, tb_reset, DUT.q, tb_tc);	// Using internal signal
  tb_clk = 1;
  tb_reset = 1;
  #70 tb_reset = 0;
  force DUT.q = 8'hef; // Forcing a value in simulation
  #10; // At least one clock cycle
  release DUT.q;
  #250 tb_reset = 1;
  #30 tb_reset = 0;
  #150 tb_reset = 1;
  #10 tb_reset = 0; 
  #50 $finish;      
end

always begin
  #5 tb_clk = ~tb_clk; 
end

// Connect DUT to test bench
cntr_8bit DUT 
(
  .clk(tb_clk),
  .reset(tb_reset),
  .tc(tb_tc)
);

endmodule