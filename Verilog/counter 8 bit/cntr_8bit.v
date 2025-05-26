// This is a Verilog Time Base Generator

module cntr_8bit
(
  input  wire clk,
  input  wire reset,
  output wire tc
);

reg [7:0] q;

always @ (posedge clk)
  if (reset)
    q = 8'b0;
  else
	if (q < 8'hff)
		q <= q + 1;
	else
		q <= 8'b0;

assign tc = (q == 8'hff) ? 1'b1 : 1'b0;

endmodule