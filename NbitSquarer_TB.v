`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2023 12:06:50
// Design Name: 
// Module Name: NbitSquarer_TB
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


module NbitSquarer_TB;
parameter n=4;
reg[n-1:0] a_in;
//reg[n-1:0] b_in;
reg clk,rst,start;

wire [(n*2)-1:0] out;
wire finish;

NbitSquarer dut(out, a_in, clk, rst ,finish, start);
defparam dut.N=n;
initial
 begin
   forever
    #50 clk=~clk;
 end
 initial
   begin
     a_in=0;
     //b_in=0;
     clk=0;
     rst=1;
     start=0;
     
     #100;
     rst = 0;
      a_in = 'd13;
		//b_in = 'd13;
		start = 0;
		#200
		start = 1;
		#(100*n)
		
		a_in = 'd10;
		//b_in = 'd3;
		start = 0;
		#200
		start = 1;
		#(100*n)
		#200
     $finish;
     
  end   
     
endmodule
