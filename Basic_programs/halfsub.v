module hs_tb();
reg a,b;
wire d,bo;
halfsub dut(a,b,d,bo);
initial begin 
{a,b}=2'b00;#10;
{a,b}=2'b01;#10;
{a,b}=2'b10;#10;
{a,b}=2'b11;#10;
end
initial $monitor("a=0%b b=%0b d=%0b bo=%0b",a,b,d,bo);
endmodule

module halfsub(
input a,b,
output d,bo
);
assign d=a^b;
assign bo=~a&b;
endmodule
