`default_nettype none

module tw_switch
(
  input  wire clk  ,
  input  wire reset,
  input  wire door_switch,
  input  wire bed_switch,
  output reg  light
 );
 
 parameter WIDTH = 1;
 parameter IDLE  = 1'b0;
 parameter ON    = 1'b1;
 
 reg [WIDTH-1 : 0] state;
 
 always @ (posedge clk)
 if (~reset)
   begin
     state  <= IDLE;
	 light <= 1'b0;
   end
 else
   case (state)
     IDLE : if ((door_switch == 1'b1) || (bed_switch == 1'b1))
              begin
                state  <= ON;
                light <= 1'b1;
              end
            else
              begin
                state  <= IDLE;
                light <= 1'b0;
              end
     ON: if ((door_switch == 1'b1) || (bed_switch == 1'b1))
              begin
                state  <= IDLE;
                light <= 1'b0;
              end
            else
              begin
                state  <= ON;
                light <= 1'b1;
              end
   endcase
 
endmodule
 
