`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 04:05:53 PM
// Design Name: 
// Module Name: main
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


module main(
input clk,
input [7:0]A, [7:0]B,
input L, R, S,
output [0:6]seg,
output [3:0]an,
output EOM
//output [19:0]bcd
//output [34:0] prodSevenSeg,
//output [15:0] productTemp
);
//wire [34:0] prodSevenSeg;

wire S_button, L_button, R_button;
wire temp;
reg neg;
wire [7:0] A_mag;
wire [7:0] B_mag;
wire [15:0] product;
wire [1:0]LRB;
wire tempEOM;
wire [19:0] bcd;
//assign productTemp = product;
 
pushButtonDetector B1 (.clk(clk), .rst(1'b0), .in(S), .out(S_button));
pushButtonDetector B2 (.clk(clk), .rst(1'b0), .in(L), .out(L_button));
pushButtonDetector B3 (.clk(clk), .rst(1'b0), .in(R), .out(R_button));


// getting 2's compliment
assign A_mag = A[7] ? (~A+1): A; 
assign B_mag = B[7] ? (~B+1): B; 

controlUnit CU (.clk(clk), .rst(S_button), .EOM(EOM));
assign tempEOM = EOM;
multiplier M (.clk(clk), .start(S_button), .load(~tempEOM), .A(A_mag), .B(B_mag), .product(product) );

xor(temp,A[7],B[7]);

always @(posedge clk) begin
if (S_button & (A == 8'b00000000 | B == 8'b00000000)) 
begin
neg = 1'b0;
end
else if (S_button) begin neg = temp; end
end


Binary_to_BCD b2b(.Binary_Input(product),.BCD(bcd),.Clk(clk),.Enable(EOM));

wire [1:0] segSel;
assign LRB = {L_button,  R_button};
RLSvnSeg LR(.clk(clk), .LRBs(LRB), .outSel(segSel));
reg [11:0] threeBCD;

always @ (posedge clk) begin
    if (EOM) begin
        if (segSel == 2'b00) threeBCD <= bcd[11:0];
        else if (segSel == 2'b01) threeBCD <= bcd[15:4];
        else if (segSel == 2'b10) threeBCD <= bcd[19:8];
        else  threeBCD <= bcd[11:0];
    end
    else 
    threeBCD <= 12'b101010101010;
end

    wire Hz200;
    wire [1:0] andsel;
    wire [3:0] BCD;
    
 clockDivider #(.n(250000)) CD(.clk(clk), .rst(1'b0), .clk_out(Hz200));
    
    binCounter #(.x(2), .n(4)) Counter2 (.clk(Hz200), .rst(1'b0), .en(1'b1), .count(andsel));
    
    assign BCD = (andsel == 2'b00 ? threeBCD[3:0] : andsel == 2'b01 ? threeBCD[7:4] : andsel == 2'b10 ? threeBCD[11:8] : {3'b111, ~neg});
    
    sevenSegWEn SVNSG (.num(BCD), .en(1'b1), .sel(andsel), .seg(seg), .an(an));



    
    
endmodule
