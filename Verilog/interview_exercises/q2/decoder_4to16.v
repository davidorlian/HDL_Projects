module decoder_4to16 (
    input enable,
    input [3:0] in,
    output [15:0] out
);

    wire [3:0] q;

    decoder_2to4 DEC1 (
        .enable(enable),
        .in(in[3:2]),
        .out(q)
    );

    decoder_2to4 DEC2 (
        .enable(q[0]),
        .in(in[1:0]),
        .out(out[3:0])
    ); 

    decoder_2to4 DEC3 (
        .enable(q[1]),
        .in(in[1:0]),
        .out(out[7:4])
    );

    decoder_2to4 DEC4 (
        .enable(q[2]),
        .in(in[1:0]),
        .out(out[11:8])
    );

    decoder_2to4 DEC5 (
        .enable(q[3]),
        .in(in[1:0]),
        .out(out[15:12])
    );

endmodule