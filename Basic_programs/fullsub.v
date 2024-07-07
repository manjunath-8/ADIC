module fullsub(a,b,bin,diff,borrow);
input a,b,bin;
output diff,borrow;
assign diff=(a^b)^bin;
assign borrow=(~a&b)|(bin & (a^(~b)));
endmodule

module fullsub_tb();
reg a,b,bin;
wire diff,borrow;
fullsub dut(a,b,bin,diff,borrow);
initial begin
a=1'b0;
b=1'b0;
bin=1'b0;
#10;
a=1'b0;
b=1'b0;
bin=1'b1;
#10;
a=1'b0;
b=1'b1;
bin=1'b0;
#10;
a=1'b0;
b=1'b1;
bin=1'b1;
#10;
a=1'b1;
b=1'b0;
bin=1'b0;
#10;
a=1'b1;
b=1'b0;
bin=1'b1;
#10;
a=1'b1;
b=1'b1;
bin=1'b0;
#10;
a=1'b1;
b=1'b1;
bin=1'b1;
#10;
end
//initial $monitor("a=%0b b=%0b diff=%0b borrow=%0b",a,b,diff,borrow);
endmodule

