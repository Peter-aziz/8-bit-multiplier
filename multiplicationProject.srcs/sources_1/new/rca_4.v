`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 02:41:50 PM
// Design Name: 
// Module Name: rca_4
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



module rca_4(input [3:0]a, [3:0]b ,input ci, output [3:0]s, output co );
wire w0,w1,w2;
full_adder f1 (.a(a[0]), .b(b[0]), .ci(ci), .co(w0), .s(s[0]));
full_adder f2 (.a(a[1]), .b(b[1]), .ci(w0), .co(w1), .s(s[1]));
full_adder f3 (.a(a[2]), .b(b[2]), .ci(w1), .co(w2), .s(s[2]));
full_adder f4 (.a(a[3]), .b(b[3]), .ci(w2), .co(co), .s(s[3]));
endmodule
