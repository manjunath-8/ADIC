module moore0110(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter s0=0,s1=1,s2=2,s3=3,s4=4;
reg [0:2]PS,NS;
always @(posedge clk,reset)
if (reset) PS<=s0;
else PS<=NS;

always @(PS,x)
case (PS)
s0:begin
z<=0;
NS<=x?s0:s1;
end
s1:begin
z<=0;
NS<=x?s2:s1;
end
s2:begin
z<=0;
NS<=x?s3:s1;
end
s3:begin
z<=0;
NS<=x?s0:s4;
end
s4:begin
z<=1;
NS<=x?s2:s1;
end
endcase
endmodule

module moore0110_tb();
reg x,clk,reset;
wire z;
reg [15:0]data;
integer i;
moore0110 dut(x,clk,reset,z);
initial clk=1'b0;
always #5 clk=~clk;
initial
begin
reset=1'b1;
#5;
reset=1'b0;
data=16'b0110110110101100;
for(i=0;i<16;i=i+1)
begin
 x=data[i];
#10;
end
#250;
$finish;
end
initial $monitor("%0b",z);
endmodule
