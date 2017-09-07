module heartbeat(
         input        CLOCK_50,
         output [9:0] LEDR,
         input [3:0]  KEY
         );
   
   wire               clk;
   wire               reset_n;
   reg [23:0]         heartbeat;
   
   assign reset_n = KEY[0];
   assign clk = CLOCK_50;
   
   always @(posedge clk, negedge reset_n)
     if (reset_n == 1'b0)
       heartbeat <= 24'b0;
     else
       heartbeat <= heartbeat + 24'b1;
   
   assign LEDR = {10{heartbeat[23]}};
   
endmodule
