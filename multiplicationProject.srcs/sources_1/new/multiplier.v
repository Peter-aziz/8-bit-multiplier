`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 04:28:07 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(input clk, start, load, input [7:0] A, B, output [15:0] product );
wire [7:0] A_saved;
wire [7:0] Addition;
wire cout;
wire [7:0]A_added;
reg_8_bit multiplicand(.clk(clk), .start(start), .D(A), .Q(A_saved));
assign A_added = product[0] ? A_saved : 0;
csa_8bit adder(.a(A_added), .b(product[15:8]), .ci(1'b0), .s(Addition), .co(cout));
shift_reg_16_bit multiplier(.clk(clk), .start(start), .load(load), .B(B), .Q(product), .addition(Addition)); 
endmodule
