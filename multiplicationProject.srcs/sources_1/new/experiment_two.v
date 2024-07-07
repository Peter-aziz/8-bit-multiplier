`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 03:45:20 PM
// Design Name: 
// Module Name: experiment_two
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


module experiment_two(input clk, rst, sig, output out);
wire clk_out;
wire sig1, sig2;
clockDivider c1(.clk(clk), .rst(rst), .clk_out(clk_out));

debouncer d(.clk(clk_out), .rst(rst), .in(sig), .out(sig1));
synchronizer s(.clk(clk_out), .rst(rst), .in(sig1), .out(sig2));
fsm edge_detect(.clk(clk_out), .rst(rst), .w(sig2), .z(out));

endmodule
