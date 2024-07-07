`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 05:20:28 PM
// Design Name: 
// Module Name: controlUnitTest
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


module controlUnitTest(

    );
    reg clk, start_button;
    wire EOM;
    controlUnit CU (.clk(clk), .rst(start_button), .EOM(EOM));
    
    initial begin
    clk = 0;
    forever #10 clk = ~clk;
    end 
    
    initial begin
    start_button = 0;
    #200
    start_button = 1;
    #100
    start_button = 0;
    #200
    start_button = 1;
    #100
    start_button = 0;
    #200
    start_button = 1;
    #100
    start_button = 0;
    end

endmodule
