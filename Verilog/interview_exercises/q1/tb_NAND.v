`timescale 1ns / 1ps

module tb_NAND ();
  
  reg  tb_a;
  reg  tb_b;
  wire tb_y;
  
  integer i, j;
  
  NAND DUT (
  	.a(tb_a),
  	.b(tb_b),
  	.y(tb_y)
  );
  
  initial
    begin
      $display(" a b | y ");
      $display("---------");
    
      for (i = 0; i < 2; i = i + 1)
 	    begin
          for (j = 0; j < 2; j = j + 1)
 	        begin
              tb_a = j;
              tb_b = i;
              #1;
              $display(" %b %b | %b", tb_a, tb_b, tb_y);
              #9;
            end
        end
    end
	
endmodule
