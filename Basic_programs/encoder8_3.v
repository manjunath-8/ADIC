module encoder8_3(
input [7:0]x,
output [2:0]y
);
assign y[0]= x[1] | x[3] | x[5] | x[7];
assign y[1]= x[2] | x[3] | x[6] | x[7];
assign y[2]= x[4] | x[5] | x[6] | x[7];
endmodule

module encoder8_3tb();
reg [7:0]x;
wire [2:0]y;
encoder8_3 dut(x,y);
initial begin
x=8'b00000001;#10;
x=8'b00000010;#10;
x=8'b00000100;#10;
x=8'b00001000;#10;
x=8'b00010000;#10;
x=8'b00100000;#10;
x=8'b01000000;#10;
x=8'b10000000;#10;
end
initial $monitor("x=%0b y=%0b",x,y);
endmodule
