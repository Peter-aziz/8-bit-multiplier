`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 04:47:30 PM
// Design Name: 
// Module Name: multiplier_test
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


module multiplier_test();
reg clk,start,load;
reg [7:0] A, B;
wire [15:0]product;

multiplier m (.clk(clk), .start(start), .load(load), .A(A), .B(B), .product(product));

initial begin
forever#10   
clk = ~clk; 
end
    
initial begin

clk = 0;
start = 0;
load = 1;
#10
A = 2;
B = 2;

start = 1;

#10
start = 0;


end    
endmodule
