`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 02:46:09 PM
// Design Name: 
// Module Name: shift_reg_16_bit
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


module shift_reg_16_bit(input clk, start, load, input [7:0]B, input [7:0]addition,  output reg [15:0]Q); // check for error in addition

always @ (posedge clk)
begin
    if(start) begin
        Q[15:8]  <= 0;
        Q[7:0] <= B; 
    end
    
    else if(load)
    begin
        Q[15:8] = addition;
        
        //            shift
            Q[0] <=Q[1];
            Q[1] <=Q[2];
            Q[2] <=Q[3];
            Q[3] <=Q[4];
            Q[4] <=Q[5];
            Q[5] <=Q[6];
            Q[6] <=Q[7];
            Q[7] <=Q[8];
            Q[8] <=Q[9];
            Q[9] <=Q[10];
            Q[10] <=Q[11];
            Q[11] <=Q[12];
            Q[12] <=Q[13];
            Q[13] <=Q[14];
            Q[14] <=Q[15];

            Q[15] <= 0;
    end
    
     
end
endmodule
