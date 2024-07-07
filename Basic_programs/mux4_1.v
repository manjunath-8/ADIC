module mux4_1(
input [3:0]i,
input [1:0]s,
output y
);
assign y=(~s[1]&~s[0]&i[0])|(~s[1]&s[0]&i[1])|(s[1]&~s[0]&i[2])|(s[1]&s[0]&i[3]);
endmodule

module mux4_1_tb();
reg [3:0]i;
reg [1:0]s;
wire y;
mux4_1 dut(i,s,y);
initial begin
i=4'b0000;s=2'b00;#10;
i=4'b0010;s=2'b01;#10;
i=4'b0100;s=2'b10;#10;
i=4'b1000;s=2'b11;#10;
end
initial $monitor("i=%0b s=%0b y=%0b",i,s,y);
endmodule


