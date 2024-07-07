module multiplier(
    input a1, a0, b1, b0,    
    output p0, p1, p2, p3   );

 assign p0 = a0 & b0;
 assign p1 = a1&~a0&b0 | a1&~b1&b0 | ~a1&a0&b1 | a0&b1&~b0;
 assign p2 = a1&~a0&b1 | a1&b1&~b0;
 assign p3 = a1&a0&b1&b0;

endmodule

module multiplier_tb();
    reg a1, a0, b1, b0;    
    wire p0, p1, p2, p3;    

 
    multiplier uut (
        .a1(a1),
        .a0(a0),
        .b1(b1),
        .b0(b0),
        .p0(p0),
        .p1(p1),
        .p2(p2),
        .p3(p3)
    );

   initial begin
     
        $monitor("Time=%0t | a1=%b a0=%b b1=%b b0=%b | p3=%b p2=%b p1=%b p0=%b", a1, a0, b1, b0, p3, p2, p1, p0);

     
        a1 = 0; a0 = 0; b1 = 0; b0 = 0; #10;
        a1 = 0; a0 = 0; b1 = 0; b0 = 1; #10;
        a1 = 0; a0 = 0; b1 = 1; b0 = 0; #10;
        a1 = 0; a0 = 0; b1 = 1; b0 = 1; #10;
       
        a1 = 0; a0 = 1; b1 = 0; b0 = 0; #10;
        a1 = 0; a0 = 1; b1 = 0; b0 = 1; #10;
        a1 = 0; a0 = 1; b1 = 1; b0 = 0; #10;
        a1 = 0; a0 = 1; b1 = 1; b0 = 1; #10;
       
        a1 = 1; a0 = 0; b1 = 0; b0 = 0; #10;
        a1 = 1; a0 = 0; b1 = 0; b0 = 1; #10;
        a1 = 1; a0 = 0; b1 = 1; b0 = 0; #10;
        a1 = 1; a0 = 0; b1 = 1; b0 = 1; #10;
       
        $finish;
    end
endmodule
