module fulladder(
input a,b,c,
output sum,carry
);
assign sum=a^b^c;
assign carry=(a&b)|(b&c)|(c&a);
endmodule

module fa_tb();
reg a,b,c;
wire sum,carry;
fulladder dut(a,b,c,sum,carry);
initial begin
{a,b,c}=3'b000;#10;
{a,b,c}=3'b001;#10;
{a,b,c}=3'b010;#10;
{a,b,c}=3'b011;#10;
{a,b,c}=3'b100;#10;
{a,b,c}=3'b101;#10;
{a,b,c}=3'b110;#10;
{a,b,c}=3'b111;#10;
end 
initial $monitor("a=%0b b=%0b c=%0b sum=%0b carry=%0b",a,b,c,sum,carry);
endmodule
