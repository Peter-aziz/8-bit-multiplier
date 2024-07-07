`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 07:10:30 PM
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
input clk, rst, output reg EOM
    );
    reg [3:0] count;
    reg en;
    
    initial begin
     EOM = 1'b0;
     en = 1'b0;
     end
    always @ (posedge clk or posedge rst) begin
   
   
   if (rst)begin
        count <= 0;
        EOM = 1'b0;
        en = 1'b1;
   end
        
    else if (en) begin
    
        if (count == 4'b0111)
        begin
            count <=0;
            en = 1'b0;
            EOM = 1'b1;
        end
        else begin
            count <= count + 1;
        end
    end
   
        
    end
    
endmodule
