`timescale 1ns / 1ps


module matrix4_tb(

    );
    reg [31:0] Aout,y;
    reg clk;
    wire [31:0] x;
    reg [31:0] A[0:10000];
    reg [31:0] At[0:10000];
    integer i,m,n=0,j,k=0;
    
    matrix4 m4(Aout,y,clk,x);
    
    initial begin
    clk=1;
    end
    
    always begin
#1.25  clk=~clk; 
    end
    
    initial begin
         for(i=0;i<10000;i=i+1)
         begin
           A[i]=k;
           k=k+1;
#2.5       Aout=A[i];    
         end   
         for(i=0;i<100;i=i+1)
         begin
            for(j=0;j<100;j=j+1)
            begin
                At[j*100+i]=A[i*100+j];
            end
         end
 #10        
         for(i=0;i<10000;i=i+1)
         begin
#2.5            Aout=At[i];
         end
         
    end
    
    
    initial begin
   for(m=0;m<10100;m=m+1)
   begin
        if(n<100)
            begin
#2.5            y=n;
                n=n+1;
            end
            else begin
                n=0;

            end
    end
    n=0;
#10    
    for(m=0;m<10100;m=m+1)
    begin
        if(n<100)
            begin
#2.5                y=n;
                n=n+1;
            end
            else begin
                n=0;
            end
    end
    
    end
endmodule
