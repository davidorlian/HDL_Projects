module D_FF (
	input  wire D,
	input  wire CLK,
	input  wire CLR,
	output reg  Q    // The value is assigned inside an always block and declared as reg.
);

always @(posedge CLK or posedge CLR) begin // Positive-edge-triggered.
	if (CLR)
		Q <= 1'b0;
	else
		Q <= D;
end
		
endmodule