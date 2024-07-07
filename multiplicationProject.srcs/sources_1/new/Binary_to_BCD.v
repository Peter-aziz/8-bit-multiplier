module Binary_to_BCD (
input Clk,
input  Enable,
input [15:0]Binary_Input,
output reg[19:0]BCD
);
parameter [2:0] IDEL = 3'b000, Setup = 3'b001,ADD = 3'b010,Shift = 3'b011, DONE = 3'b100;
//Registers
reg[35:0] bcd_data;
reg [2:0] state;
reg busy;
reg [3:0] counter;



always @(posedge Clk) begin
if(Enable) begin
    if(~busy) begin
    bcd_data <= {16'b0,Binary_Input}; //initlize first 16 to 0 and the other to the binary data entered.
    state <= Setup;// Move to next stage
    end
end
case(state)
//----------------------------
IDEL: begin // Begining State. State is free and ready for another 16 bit binary 
busy <= 0;
end
//----------------------------
Setup: begin
busy <= 1;
state <=ADD;
end
//----------------------------
ADD: begin
//---------------- Ones
if(bcd_data[19:16] > 4)
begin
bcd_data[35:16] <= bcd_data[35:16]+3;
end
//---------------- Tens
if(bcd_data[23:20] > 4)
begin
bcd_data[35:20] <= bcd_data[35:20]+3;
end
//---------------- Hundreds
if(bcd_data[27:24] > 4)
begin
bcd_data[35:24] <= bcd_data[35:24]+3;
end
//---------------- Thousands
if(bcd_data[31:28] > 4)
begin
bcd_data[35:28] <= bcd_data[35:28]+3;
end
//---------------- Ten Thousands
if(bcd_data[35:32] > 4)
begin
bcd_data[35:32] <= bcd_data[35:32]+3;
end
state <= Shift;
end
Shift: begin
counter <= counter+1;
bcd_data <= bcd_data <<1;
if(counter == 15) begin
counter <=0;
state <=DONE;
end
else begin
state <=ADD;
end
end
DONE: begin
state <= DONE;
end
default: begin
state <=IDEL;
end
endcase
if(state == DONE)begin
 BCD = bcd_data[35:16];  
 state<=IDEL;                
end
end
endmodule


















