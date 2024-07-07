module GCD(input [31:0] a, input [31:0] b, output reg [31:0] gcd);

reg [31:0] temp;
reg [31:0] A;
reg [31:0] B;

always @(*) begin
  A=a;B=b;
  temp = A;
  while (B != 0) begin
    temp = B;
    B = A % B;
    A = temp;
  end
 assign gcd = temp;
end

endmodule

module GCD_tb;

reg [31:0] a;
reg [31:0] b;
wire [31:0] gcd;

GCD dut (a, b, gcd);

initial begin
  a = 48;
  b = 18;
  #10 $display("GCD of %d and %d is %d", a, b, gcd);

  a = 123456789;
  b = 987654321;
  #10 $display("GCD of %d and %d is %d", a, b, gcd);
end

endmodule
