module XOR (
	input  a, b,
	output y
);

	wire q1_1, q1_2, q2_1, q2_2;

	NAND NAND1 (
		.a(a),
		.b(a),
		.y(q1_1)
	);
	
	NAND NAND2 (
		.a(b),
		.b(b),
		.y(q1_2)
	);

	NAND NAND3 (
		.a(q1_1),
		.b(b),
		.y(q2_1)
	);

	NAND NAND4 (
		.a(a),
		.b(q1_2),
		.y(q2_2)
	);
	
	NAND NAND5 (
		.a(q2_1),
		.b(q2_2),
		.y(y)
	);

endmodule	
	