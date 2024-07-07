`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 02:16:57 PM
// Design Name: 
// Module Name: 8-bit_reg
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


module reg_8_bit(input clk, start, input [7:0]D, output reg [7:0]Q);
always @ (posedge clk)
 if (start)
 Q <=D;
endmodule
