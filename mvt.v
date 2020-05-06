`timescale 1ns / 1ps


module matrix4(
    input [31:0] Aout,
    
    input [31:0] y,
    
    input clk,
    output [31:0] x
    
    );
        reg [31:0] x;
    real frequency;
    real t0;
    real t1;
    
    initial begin
    @(posedge clk)t0=$realtime;
        x=0;
        end
   always@(posedge clk)
   begin
        if((y<100)&&(y!=0))
        begin
        x=x+Aout*y;
        end
        else if(y==0)
        begin
            x=0;
        end
 @ (posedge clk) t1 = $realtime;
frequency = 1.0e9 / (t1 - t0);
$display("Frequency = %g", frequency);
   end
endmodule
