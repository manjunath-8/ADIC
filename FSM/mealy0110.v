module mealy0110(x,clk,reset,y);
input x,clk,reset;
output reg y;
parameter s0=0,s1=1,s2=2,s3=3;
reg [1:0]ps,ns;
always @(posedge clk)
begin
if(reset==1'b1)
ps<=s0;
else
ps<=ns;
end

always @(ps,x)
case(ps)
s0: begin
    y<=x?0:0;
    ns<=x?s0:s1;
    end
s1: begin
    y<=x?0:0;
    ns<=x?s2:s1;
    end
s2: begin
    y<=x?0:0;
    ns<=x?s3:s1;
    end
s3: begin
    y<=x?0:1;
    ns<=x?s0:s1;
    end
endcase
endmodule

module mealy0110_tb();
reg x;
reg reset;
reg clk;
wire y;
integer i;
reg [15:0]a;

mealy0110 dut(x,clk,reset,y);
initial begin
clk=1'b0;
reset=1'b1;#10;
reset=1'b0;
end
always #5 clk=~clk;

initial begin 
a=16'b0011001101011010;
for(i=0;i<16;i=i+1)
#10 x=a[i];
#250;
$finish;
end
initial $monitor("x=%0b y=%0b",x,y);
endmodule
