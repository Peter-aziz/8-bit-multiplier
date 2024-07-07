`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 03:49:06 PM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(input clk, rst, in, output out);
reg q1,q2;
always@(posedge clk, posedge rst) begin
 if(rst == 1'b1) begin
 q1 <= 0;
 q2 <= 0;
 end
 else begin
 q1 <= in;
 q2 <= q1;
 end
end
assign out = q2;
endmodule