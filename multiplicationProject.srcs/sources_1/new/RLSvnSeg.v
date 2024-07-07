`timescale 1ns / 1ps



module RLSvnSeg(
input clk, input [1:0] LRBs, output reg [1:0]outSel);
    reg [1:0] state, nextState;
    wire clkOut;
    clockDivider #(250000) CD (.clk(clk), .rst(1'b0), .clk_out(clkOut));
parameter [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
// Next state generation (combinational logic)


always @ (LRBs[0] or LRBs[1] or state) begin
    case (state)
    S0:  begin
    outSel = 2'b00;
     if (LRBs == 2'b10) nextState = S1;
     else  nextState = S0;
     end
    S1: begin
    outSel = 2'b01;
     if (LRBs == 2'b10) nextState = S2;
    else if (LRBs == 2'b01) nextState = S0;
     else nextState = S1;
     end
    S2: begin
    outSel = 2'b10;
     if (LRBs == 2'b01) nextState = S1;
     else nextState = S2;
     end
     
    default: begin
    nextState = S0;
    outSel = S0;
    end
    endcase
    end
// State register
// Update state FF's with the triggering edge of the clock
always @ (posedge clkOut) begin
     state <= nextState;
end
// output generation (combinational logic)

endmodule

