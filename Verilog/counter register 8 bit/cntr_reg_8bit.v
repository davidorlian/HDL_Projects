module cntr_reg_8bit (
  input  clk,
  input  rst,
  input  load,
  input  re_load,
  input  [7:0] data_in,
  output [7:0] data_out,
  output tc
);

reg q_lode_en;
wire q_tc;
wire [7:0] q_load_val;

  register_8bit reg_DUT (
    .CLK(clk),
    .RST(rst),
    .load(load),
    .data_in(data_in),
    .data_out(q_load_val) 
  );
  
  cntr_8bit cntr_DUT (
    .clk(clk),
    .reset(q_lode_en),
    .load(q_load_val),
    .count(data_out),
    .tc(q_tc)
  );

  always @(posedge clk) begin
    q_lode_en <= re_load | q_tc;
  end

  assign tc = q_tc;  

endmodule