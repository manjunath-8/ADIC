module synchronus_ram(clk,d_in,d_out,addr,cs,rw);
parameter addr_size=10,data_size=8,mem_size=1024;
input clk;
input [data_size-1:0]d_in;
input [addr_size-1:0]addr;
input cs,rw;
reg [data_size-1:0]mem[mem_size-1:0];
output reg [data_size-1:0]d_out;
always @(posedge clk)
begin 
  if(cs && rw)
  mem[addr]=d_in;
  if(cs && !rw)
  d_out=mem[addr];
end
endmodule

module synchronus_ram_tb();
reg clk;
reg [7:0]d_in;
reg [9:0]addr;
reg cs,rw;
wire [7:0]d_out;

synchronus_ram dut(clk,d_in,d_out,addr,cs,rw);
initial clk=1'b1;
always #1 clk=~clk;

initial begin
cs=1'b1;
rw=1'b1;
addr=10'd1;
d_in=8'd14;
#2;
cs=1'b1;
rw=1'b1;
addr=10'd4;
d_in=8'd12;
#2;

cs=1'b1;
rw=1'b0;
addr=10'd1;
#2;
cs=1'b1;
rw=1'b0;
addr=10'd4;
#2;
cs=1'b1;
rw=1'b0;
addr=10'd4;
#2;

$finish;
end
endmodule
