module park(clk,veh,pass,reset,BS,count,error,not_a);
input clk,reset;
input [2:0]veh;
input [1:0]pass;
output reg[1:0]count;
output reg BS;
output reg error;
output reg not_a;

reg [7:0]mem;
reg [7:0]tdl;
integer c;
reg[1:0]state;
reg FS;

initial FS=0;
initial c=0;
initial mem=0;
initial tdl=0;

parameter init=2'b00, password=2'b01, back=2'b10, init2=2'b11;

always @(posedge clk)
begin
 if(reset)
  begin 
   BS<=0;
   c<=0;
   not_a<=0;
   count<=2'b11;
   state<=init;
  end
else
  begin
   case(state)
    init: begin
          BS<=0;
          error<=0;
          count<=2'b11;
          FS<=0;
          if(veh!=3'b000)
          begin
          FS<=1;
          if(veh!=mem)
           begin
           not_a<=0;
           tdl<=veh;
           state<=password;
           end
          else
           begin
           not_a<=1; 
           state<=init;
           end
          end
          else
          state<=init;
          end
    password: begin
              FS<=0;
              if(pass==2'b11)
              state<=back;
              else
               begin
                count<=count-1;
                if(count>0)
                state<=password;
                else
                begin
                error<=1;
                mem<=tdl;
                state<=init;
                end
               end
              end
    back: begin
          BS<=1'b1;
          state<=init;
          end
   endcase
  end
end

always @(posedge clk)
begin
c<=c+1;
if(c==30)
 begin
 mem<=0;
 c=0;
 end
end

endmodule

module park_tb();
reg clk;
reg reset;
reg[2:0]veh;
reg [1:0]pass;

wire [1:0]count;
wire BS;
wire error;
wire not_a;

park uut(.clk(clk),
         .reset(reset),
         .veh(veh),
         .pass(pass),
         .BS(BS),
         .count(count),
         .error(error),
         .not_a(not_a)       
         );

initial clk=1'b1;
always #1 clk=~clk;

initial begin
reset=1'b1;#2;
reset=1'b0;

veh=3'b001;#2;
veh=3'bxxx;
pass=2'b10;#2;
pass=2'b01;#2;
pass=2'b11;#2;
pass=2'bxx;
#10;

veh=3'b010;#2;
veh=3'bxxx;
pass=2'b10;#2;
pass=2'b00;#2;
pass=2'b01;#2;
pass=2'bxx;
#10;

veh=3'b011;#2;
veh=3'bxxx;
pass=2'b11;#2;
pass=2'b00;#2;
pass=2'b01;#2;
pass=2'bxx;
#10;

veh=3'b010;#2;
veh=3'bxxx;
pass=2'b11;#2;
pass=2'bxx;

veh=3'b100;#2;
veh=3'bxxx;
pass=2'b10;#2;
pass=2'b01;#2;
pass=2'b11;#2;
pass=2'bxx;
#10;

veh=3'b010;#2;
veh=3'bxxx;
pass=2'b10;#2;
pass=2'b00;#2;
pass=2'b11;#2;
pass=2'bxx;
#10;
$finish; #100;
end
endmodule

