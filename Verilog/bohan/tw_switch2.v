`default_nettype none

module tw_switch2
(
  input  wire clk  ,
  input  wire reset,
  input  wire door_switch,
  input  wire bed_switch,
  output reg  light
  );
 
  parameter WIDTH = 2;
  parameter IDLE  = 2'b00;
  parameter TON   = 2'b01;
  parameter ON    = 2'b10;
  parameter TOFF  = 2'b11;

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
                 state  <= TON;
                 light <= 1'b0;
               end
             else
               begin
                 state  <= IDLE;
                 light <= 1'b0;
               end
      TON:
          begin
            state  <= ON;
            light <= 1'b1;
          end
      ON: if ((door_switch == 1'b1) || (bed_switch == 1'b1))
               begin
                 state  <= TOFF;
                 light <= 1'b1;
               end
             else
               begin
                 state  <= ON;
                 light <= 1'b1;
               end
      TOFF:
          begin
            state  <= IDLE;
            light <= 1'b0;
          end
    endcase
 
endmodule
 
