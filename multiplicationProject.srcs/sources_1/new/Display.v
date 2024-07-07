`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 12:17:52 PM
// Design Name: 
// Module Name: Display
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


module Display(
input [3:0]Ones,
input [3:0]Tenth,
input [3:0]Hundreds,
input [3:0]Thousands,
input [3:0]Ten_Thousands,

output [6:0]Ones_Seg,
output [6:0]Ten_Seg,
output [6:0]Hund_Seg,
output [6:0]Thous_Seg,
output [6:0]TenThous_Seg);
    
  BCD_to_SevenSeg BCD1 (.bcd(Ones),.seg(Ones_Seg));  
  BCD_to_SevenSeg BCD2 (.bcd(Tenth),.seg(Ten_Seg));
  BCD_to_SevenSeg BCD3 (.bcd(Hundreds),.seg(Hund_Seg));  
  BCD_to_SevenSeg BCD4 (.bcd(Thousands),.seg(Thous_Seg));  
  BCD_to_SevenSeg BCD5 (.bcd(Ten_Thousands),.seg(TenThous_Seg)); 
  
  
   
endmodule
