//this is a 

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);

endmodule


module testfour_bit_adder;
reg a, b, carryin;
wire sum, carryout;
structuralFullAdder adder(sum, carryout, a , b, carryin);

initial begin
  // Your test code here
$display("a b Cin | sum  Cout  | Expected Sum  Expected Carryout");
a=0;b=0;carryin=0; #1000 
$display("%b %b  %b  |  %b    %b    |       0            0  ", a, b, carryin, sum, carryout);
a=0;b=0;carryin=1; #1000 
$display("%b %b  %b  |  %b    %b    |       1            0  ", a, b, carryin, sum, carryout);
a=0;b=1;carryin=0; #1000 
$display("%b %b  %b  |  %b    %b    |       1            0  ", a, b, carryin, sum, carryout);
a=0;b=1;carryin=1; #1000 
$display("%b %b  %b  |  %b    %b    |       0            1  ", a, b, carryin, sum, carryout);
a=1;b=0;carryin=0; #1000 
$display("%b %b  %b  |  %b    %b    |       1            0  ", a, b, carryin, sum, carryout);
a=1;b=0;carryin=1; #1000 
$display("%b %b  %b  |  %b    %b    |       0            1  ", a, b, carryin, sum, carryout);
a=1;b=1;carryin=0; #1000 
$display("%b %b  %b  |  %b    %b    |       0            1  ", a, b, carryin, sum, carryout);
a=1;b=1;carryin=1; #1000 
$display("%b %b  %b  |  %b    %b    |       1            1  ", a, b, carryin, sum, carryout);
end
endmodule