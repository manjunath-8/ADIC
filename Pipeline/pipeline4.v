module pipeline4(clk,rs1,rs2,rd,func,addr,f);
input [3:0]rs1,rs2,rd,func;
input [7:0]addr;
input clk;
output reg [15:0]f;
reg [15:0]regbank[0:15];
reg [15:0]mem[0:255];

reg [15:0]L12_a,L12_b,L23_f,L34_f;
reg [4:0]L12_rd,L12_func,L23_rd;
reg [7:0]L12_addr,L23_addr,L34_addr;

always @(posedge clk)
begin
L12_a<=regbank[rs1];
L12_b<=regbank[rs2];
L12_rd<=rd;                //stage 1
L12_func<=func;
L12_addr<=addr;
end

always @(posedge clk)
begin
L23_rd<=L12_rd;
L23_addr<=L12_addr;
case(L12_func)
0: f<=L12_a+L12_b;     //stage 2
1: f<=L12_a-L12_b;
2: f<=L12_a*L12_b;
3: f<=L12_a/L12_b;
4: f<=L12_a%L12_b;
endcase
L23_f<=f;
end

always @(posedge clk)
begin
regbank[L23_rd]<=L23_f;
L34_f<=L23_f;           //stage 3
L34_addr<=L23_addr;
end

always @(posedge clk)
begin
mem[L34_addr]<=L34_f;  //stage 4
end

endmodule

module pipeline4_tb();
reg [3:0]rs1,rs2,rd,func;
reg [7:0]addr;
wire [15:0]f;
reg clk;
integer i;

pipeline4 dut(clk,rs1,rs2,rd,func,addr,f);
initial clk=1'b0;
always #5 clk=~clk;

initial begin
for(i=0;i<16;i=i+1)
dut.regbank[i]=i;
end

initial begin
#5; rs1=4'd4;rs2=4'd2;func=4'd0;addr=8'd0;rd=4'd0;
#10; rs1=4'd5;rs2=4'd1;func=4'd1;addr=8'd3;rd=4'd2;

end
initial begin
$monitor("rs1=%0d rs2=%0d func=%0d addr=%0d rd=%0d value_bank=%0d value_mem=%0d f=%0d",dut.regbank[rs1],dut.regbank[rs2],func,addr,rd,dut.regbank[rd],dut.mem[addr],f);
#100 $finish;
end
endmodule

