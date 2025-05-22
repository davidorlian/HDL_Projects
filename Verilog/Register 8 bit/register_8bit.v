module register_8bit(
    input  wire CLK,
    input  wire RST,
    input  wire lode, // All driven by external logic should be declared as wire
    input  wire [7:0] data_in,
    output wire [7:0] data_out 
);

    reg [7:0] d_input;
    wire [7:0] q_output;

    D_FF DFF0 ( .D(d_input[0]), .CLK(CLK), .CLR(RST), .Q(q_output[0]) );
    D_FF DFF1 ( .D(d_input[1]), .CLK(CLK), .CLR(RST), .Q(q_output[1]) );
    D_FF DFF2 ( .D(d_input[2]), .CLK(CLK), .CLR(RST), .Q(q_output[2]) );
    D_FF DFF3 ( .D(d_input[3]), .CLK(CLK), .CLR(RST), .Q(q_output[3]) );
    D_FF DFF4 ( .D(d_input[4]), .CLK(CLK), .CLR(RST), .Q(q_output[4]) );
    D_FF DFF5 ( .D(d_input[5]), .CLK(CLK), .CLR(RST), .Q(q_output[5]) );
    D_FF DFF6 ( .D(d_input[6]), .CLK(CLK), .CLR(RST), .Q(q_output[6]) );
    D_FF DFF7 ( .D(d_input[7]), .CLK(CLK), .CLR(RST), .Q(q_output[7]) );

    always @(*) begin
        if (lode) begin
            d_input <= data_in;
        end else begin
            d_input <= q_output;
        end
    end

    assign data_out = q_output;

endmodule