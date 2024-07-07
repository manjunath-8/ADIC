module halfadder(
input a,b,
output sum,carry
);
assign sum=a^b;
assign carry=a&b;
endmodule

module ha_tb();
reg a,b;
wire sum,carry;
halfadder dut(a,b,sum,carry);
initial begin 
{a,b}=2'b00;#10;
{a,b}=2'b01;#10;
{a,b}=2'b10;#10;
{a,b}=2'b11;#10;
end
initial $monitor("a=0%b b=%0b sum=%0b carry=%0b",a,b,sum,carry);
endmodule
