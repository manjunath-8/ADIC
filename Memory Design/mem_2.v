module mem_2(addr,rd,wt,cs,data_in,data_out);

parameter addr_size=10,data_size=8,memory_size=1024;

input [addr_size-1:0]addr;
input rd,wt,cs;
input [data_size-1:0]data_in;
output reg [data_size-1:0]data_out;
reg [data_size-1:0]mem[memory_size-1:0];

assign data_in=(cs && rd )? data_out:8'bz;

always @ (addr or data_in or rd or cs or wt)
if(cs && wt && !rd)
mem[addr]=data_in;
always @ (addr or data_in or rd or cs or wt)
if(cs && !wt && rd)
data_out=mem[addr];

endmodule
module mem_2_tb();
reg [9:0]addr;
reg rd,wt,cs,clk;
reg [7:0]data_in;
wire [7:0]data_out;
integer k,myseed;

mem_2 dut(addr,rd,wt,cs,data_in,data_out);

initial
begin
for(k=0;k<=1023;k=k+1)
begin
data_in=(k+k)%256;
rd=0;wt=1;cs=1;
#2 addr=k;wt=0;cs=0;
end
repeat(20)
begin
#2 addr=$random(myseed)%1024;
wt=0;cs=1;rd=1;
$display("Address: %5d,Data: %4d",addr,data_out);
end
end
initial myseed=35;
endmodule
