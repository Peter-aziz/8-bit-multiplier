`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 02:44:08 PM
// Design Name: 
// Module Name: csa_8bit
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


module csa_8bit(input [7:0]a,input [7:0]b, input ci,output [7:0]s, output co);
wire [2:0]w;
wire [7:0]temp_s;
rca_4 r1 (.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(w[0]));
rca_4 r2 (.a(a[7:4]), .b(b[7:4]), .ci(1'b0), .s(temp_s[3:0]), .co(w[1]));
rca_4 r3 (.a(a[7:4]), .b(b[7:4]), .ci(1'b1), .s(temp_s[7:4]), .co(w[2]));

mux m1 (w[1],w[2],w[0],co);

mux m2 (temp_s[0],temp_s[4],w[0],s[4]);
mux m3 (temp_s[1],temp_s[5],w[0],s[5]);
mux m4 (temp_s[2],temp_s[6],w[0],s[6]);
mux m5 (temp_s[3],temp_s[7],w[0],s[7]);

endmodule