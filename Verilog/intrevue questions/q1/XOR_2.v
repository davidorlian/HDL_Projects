module XOR_2 (
	input  a, b,
	output y
);

	wire q1_1, q1_2, q2_1, q2_2;
	
	assign q1_1 = ~(  a  &  a  );
	assign q1_2 = ~(  b  &  b  );
	assign q2_1 = ~(q1_1 &  b  );
	assign q2_2 = ~(  a  & q1_2);
	assign   y  = ~(q2_1 & q2_2);

endmodule	
	