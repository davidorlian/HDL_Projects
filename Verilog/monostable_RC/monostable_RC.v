module monostable_RC
#( parameter RESISTOR = 1000;
   parameter CAPACITOR = 100e-9;
)
(
   input wire trigger,
   output wire pulse
);

   localparam RC_TAU_SECONDS = RESISTOR * CAPACITOR;
   // Using integer'() for robustness with #delay, assuming `timescale 1ns/...`
   localparam TIMED_OFF_DURATION_NS = integer'(3 * RC_TAU_SECONDS * 1e9);
   
   reg current_pulse;

   initial begin
      current_pulse <= 1'b0;
   end

   always @(posedge trigger or negedge trigger) begin
      if (trigger == 1) begin
         current_pulse = 1'b1;
      end elsif (trigger == 0) begin
         current_pulse = 1'b1; 
         #(TIMED_OFF_DURATION_NS) 
         current_pulse = 1'b0;
      end
   end

   assign pulse = current_pulse;
    
endmodule