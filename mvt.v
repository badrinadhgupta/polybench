`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2020 14:03:57
// Design Name: 
// Module Name: matrix3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module matrix3(Aout,Atout,y1,y2,clk,x1,x2);
    input [31:0] Aout,Atout,y1,y2,clk;
    output [31:0] x1,x2;
    reg [31:0] x1,x2;
    
    
    initial begin
        x1=0;
        x2=0;
        end
   always@(posedge clk)
   begin
        if((y1<100))
        begin
        x1=x1+Aout*y1;
        x2=x2+Atout*y2;  
        end
        else
        begin
            x1=0;
            x2=0;
        end;
   end
endmodule
