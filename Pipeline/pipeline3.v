module pipeline_3(a,b,c,d,f,clk);
parameter n=10;
input [n-1:0]a,b,c,d;
input clk;
output [n-1:0]f;
reg [n-1:0]LP12_x1,LP12_x2,LP12_d,LP23_x3,LP23_d,LP34_f;
assign f=LP34_f;

always @(posedge clk)
begin
LP12_x1<= #4 a+b;
LP12_x2<= #4 c-d;
LP12_d=d;

LP23_d<=LP12_d;
LP23_x3<= #4 LP12_x1+LP12_x2;

LP34_f<= #6 LP23_d*LP23_x3;

end 
endmodule

module pipeline_tb();
parameter n=10;
reg [n-1:0]a,b,c,d;
reg clk;
wire [n-1:0]f;

pipeline_3 dut(a,b,c,d,f,clk);
initial clk=1'b0;
always #10 clk=~clk;

initial begin
#5; a=10; b=10;c=6;d=3; //f=69
#20; a=5;b=5;c=5;d=3; // f=36
#20; a=20;b=11;c=6;d=4; // f=132
end
initial $monitor("f=%0d",f);
endmodule
