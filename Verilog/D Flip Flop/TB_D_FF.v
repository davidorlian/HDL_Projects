`timescale 1ns / 1ps

module TB_D_FF;

	reg  TB_D; // In tb use reg for signals that are driven or changed to stimulus the design (often connected to input).
	reg  TB_CLK;
	reg  TB_CLR;
	wire TB_Q;  // In tb use wire for signals that are observed from your design (often connected to output).

	D_FF DUT (
		.D  (TB_D  ),
		.CLK(TB_CLK),
		.CLR(TB_CLR),
		.Q  (TB_Q  )
	);
	
	initial begin
		TB_CLK = 0;
		TB_CLR = 1;
		TB_D = 0;		
		#5 TB_CLR = 0;
	end
	
	always begin
		#5 TB_CLK = ~TB_CLK;
	end
	
	always begin
		#10 TB_D = $random % 2; // $random is 32-bit signed int, %2 to restrict to just 0 or 1
	end
	
	always begin
		#30
		if ($random % 2 == 0) begin
			TB_CLR = 1;     
			#5 TB_CLR = 0;
	end
end

	
	initial begin
		$monitor("Time = %0t | TB_CLK = %b | TB_CLR = %b | D = %b | Q = %b", $time, TB_CLK, TB_CLR, TB_D, TB_Q);
    end
	
endmodule