module CD74AC174 (
	input  CLK,
	input  CLR,
	input  D1, D2, D3, D4, D5, D6, 
	output Q1, Q2, Q3, Q4, Q5, Q6
);

		D_FF DFF1 (
			.CLK(CLK),
			.CLR(~CLR),  //Acteav low
			.D(D1),
			.Q(Q1)
		);

		D_FF DFF2 (
			.CLK(CLK),
			.CLR(~CLR),
			.D(D2),
			.Q(Q2)
		);

		D_FF DFF3 (
			.CLK(CLK),
			.CLR(~CLR),
			.D(D3),
			.Q(Q3)
		);

		D_FF DFF4 (
			.CLK(CLK),
			.CLR(~CLR),
			.D(D4),
			.Q(Q4)
		);

		D_FF DFF5 (
			.CLK(CLK),
			.CLR(~CLR),
			.D(D5),
			.Q(Q5)
		);

		D_FF DFF6 (
			.CLK(CLK),
			.CLR(~CLR),
			.D(D6),
			.Q(Q6)
		);

endmodule