`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2020 14:08:33
// Design Name: 
// Module Name: matrix3_tb
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


module matrix3_tb( );
    reg [31:0] Aout,Atout,y1,y2;
    reg clk;
    wire [31:0] x1,x2;
    reg [31:0] A[0:10000];
    reg [31:0] At[0:10000];
    integer i,m,n=0,j;
    
    matrix3 m3(Aout,Atout,y1,y2,clk,x1,x2);
    
    initial begin
    clk=1;
    
    end
    
    always begin
#2.5  clk=~clk; end
    
    initial begin
         for(i=0;i<10000;i=i+1)
         begin
           A[i]=i+4;
         end   
         for(i=0;i<100;i=i+1)
         begin
            for(j=0;j<100;j=j+1)
            begin
                At[j*100+i]=A[i*100+j];
            end
         end
    end
    
    initial begin
    
        for(m=0;m<10000;m=m+1)
        begin
#5          Aout=A[m];
            Atout=At[m];
        end
    end
    
    initial begin
    for(m=0;m<10000;m=m+1)
    begin
        if(n<100)
            begin
 #5               y1=n;
                y2=n+1;
                n=n+1;
            end
            else begin
                n=0;
            end
    end
    end
endmodule
