`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 08:58:08 PM
// Design Name: 
// Module Name: Main_Test
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


module Main_Test();

reg clk;
reg [7:0]A;
reg[7:0]B;
reg L, R, S;
wire [0:6]seg;
wire [19:0]bcd;
wire [3:0]an;
wire EOM;
wire [34:0] prodSevenSeg;
wire [15:0] productTemp;

main m (.A(A),.an(an),.B(B),.clk(clk),.EOM(EOM),.L(L),.R(R),.S(S),.seg(seg),.prodSevenSeg(prodSevenSeg),.productTemp(productTemp),.bcd(bcd));


initial begin 
clk = 0;
forever#10
clk = ~clk;
end
initial begin
S=1'b0;
#100
L =0;
R = 0;
A = 2;
B = 2;
S=1'b1;
#100
S=1'b0;
#1000
A=3;
B=4;
S=1'b1;
#100
S=1'b0;
end



endmodule
