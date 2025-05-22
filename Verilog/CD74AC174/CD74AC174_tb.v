`timescale 1ns / 1ps

module CD74AC174_tb ();

    // Declare test bench signals
    reg  CLK_tb;
    reg  CLR_tb;
    reg  [5:0] D_bus_tb; // For tb it is easyer to use bus.
    wire [5:0] Q_bus_tb; 

    CD74AC174 UUT (  // Same as DUT
        .CLK(CLK_tb),
        .CLR(CLR_tb),
        .D1(D_bus_tb[0]),
        .D2(D_bus_tb[1]),
        .D3(D_bus_tb[2]),
        .D4(D_bus_tb[3]),
        .D5(D_bus_tb[4]),
        .D6(D_bus_tb[5]),
        .Q1(Q_bus_tb[0]),
        .Q2(Q_bus_tb[1]),
        .Q3(Q_bus_tb[2]),
        .Q4(Q_bus_tb[3]),
        .Q5(Q_bus_tb[4]),
        .Q6(Q_bus_tb[5])
    );

    initial begin // Only 1 initial loop!
        CLK_tb = 0;
		D_bus_tb = 0;
		CLR_tb = 1;
        forever #5 CLK_tb = ~CLK_tb; // The clock is often considered part of the initial.
    end

	always begin
		#10
		D_bus_tb = $random & 6'h3F; // Get the lower 6 random bits
        $display("Time=%0t: D_bus=%b, Q_bus=%b", $time, D_bus_tb, Q_bus_tb);
	end

	always begin
		#30
		if ($random % 2 == 0) begin
			CLR_tb = 0;     
			#5 CLR_tb = 1;
		end
	end

endmodule