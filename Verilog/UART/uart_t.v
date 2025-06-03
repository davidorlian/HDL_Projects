module uart_t (
    input clk,
    input start,
    input [6:0] data,
    output reg tx,
);
    
    reg busy;
    reg parity;
    integer i;

    always @(start) begin
            parity <= 0;
            tx <= 1;
            i <= 0;
    always @(posedge clk) begin
        tx <= data[i];
        parity <= parity ^ tx;
        i = i + 1;
    end
            tx = parity;
            tx = 0;
    end


endmodule