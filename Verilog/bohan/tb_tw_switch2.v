`default_nettype none
`timescale 1 ns / 1 ps

module tb_tw_switch2 ();

reg  clk;
reg  reset;
reg  door_switch;
reg  bed_switch;
wire light;

initial 
  clk = 1'b1;
  
always
  #5 clk = ~clk;
  
initial 
  begin
    reset = 1'b0;
	#117;
	reset = 1'b1;
  end
  
initial 
  begin
  
  	$monitor("time = %8t | D = %b | B = %b | L = %b",
          $time, door_switch, bed_switch, light);	

    door_switch = 1'b0;
	bed_switch = 1'b0;
	#217 door_switch = 1'b1;
	#10  door_switch = 1'b0;
	#50  door_switch = 1'b1;
	#10  door_switch = 1'b0;
	
    #50  bed_switch = 1'b1;
	#10  bed_switch = 1'b0;
	#50  bed_switch = 1'b1;
	#10  bed_switch = 1'b0;

	#50  door_switch = 1'b1;
	#10  door_switch = 1'b0;
	#50  bed_switch = 1'b1;
	#10  bed_switch = 1'b0;
	
	#50  bed_switch = 1'b1;
	#10  bed_switch = 1'b0;
	#50  door_switch = 1'b1;
	#10  door_switch = 1'b0;
	
	#50  bed_switch = 1'b1;
	#10  bed_switch = 1'b0;
	#50  door_switch = 1'b1;
	#10  door_switch = 1'b0;
	#50  bed_switch = 1'b1;
	#10  bed_switch = 1'b0;
	
  end

tw_switch DUT
(
.clk         (clk   ),
.reset       (reset ),
.door_switch (door_switch  ),
.bed_switch  (bed_switch  ),
.light       (light)
);

tw_switch2 DUT2
(
.clk         (clk   ),
.reset       (reset ),
.door_switch (door_switch  ),
.bed_switch  (bed_switch  ),
.light       (light)
);

endmodule
