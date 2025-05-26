module cntr_8bit
(
  input  wire clk,
  input  wire reset,
  input  wire [7:0] load,
  output wire [7:0] count,
  output wire tc
);

reg [7:0] q;

always @ (posedge clk)
  if (reset)
    q = 8'hff - load;
  else
	if (q < 8'hff)
		q <= q + 1;
	else
		q <= 8'hff - load;

assign count = q;
assign tc = (q == 8'hff) ? 1'b1 : 1'b0;

endmodule