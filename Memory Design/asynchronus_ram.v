module asynchronus_ram(d_in,d_out,addr,cs,rw);

parameter addr_size=10,data_size=8,mem_size=1024;
input [data_size-1:0]d_in;
input [addr_size-1:0]addr;
input cs,rw;
reg [data_size-1:0]mem[mem_size-1:0];
output reg [data_size-1:0]d_out;
always @(addr or d_in or rw or cs)
if(rw)
mem[addr]<=d_in;
always @(addr or d_in or rw or cs)
if(!rw)
d_out<=mem[addr];
endmodule

module asynchronus_ram_tb();
reg [7:0]d_in;
reg [9:0]addr;
reg cs,rw;
wire [7:0]d_out;

asynchronus_ram dut(d_in,d_out,addr,cs,rw);
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
