`timescale 1ns / 1ps
module Binary_to_BCD_Test();

//input Clk,Enable,
//input [15:0]Binary_Input,
//output [19:0]BCD,
//output Complete
    // Input
    reg [16:0] Binary_Data;
    reg en,clk;
    // Output
    wire [19:0] bcd;
   
     Binary_to_BCD b2b(.Binary_Input(Binary_Data),.BCD(bcd),.Clk(clk),.Enable(en));
initial begin
clk = 0;
forever #10 clk = ~clk;
end
initial begin
en = 1;
Binary_Data = 13453;

#700

en =1;
Binary_Data = 11111;
rst=1;






end 
endmodule
