module decoder2_4(
input [1:0]x,
output [3:0]y
);

assign y[0]=~x[1]&~x[0];
assign y[1]=~x[1]&x[0];
assign y[2]=x[1]&~x[0];
assign y[3]=x[1]&x[0];
endmodule

module decoder4_1_tb();
reg [1:0]x;
wire [3:0]y;
decoder2_4 dut(x,y);
initial begin
x=2'b00;#10;
x=2'b01;#10;
x=2'b10;#10;
x=2'b11;#10;
end 
initial $monitor("x=%0b y=%0b",x,y);
endmodule
