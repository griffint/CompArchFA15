module behavioralFullAdder(output[7:0] sum, output carryout,input[7:0] a,input[7:0] b, input carryin);
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
  // Your adder code here
//xor gates
wire bxorout;
xor axor(out, a, bxorout);
xor bxor(bxorout, b, carryin);
//and gates
wire bcandout, acandout, abandout;
and bcand(bcandout, b, carryin);
and acand(acandout, a, carryin);
and aband(abandout, a,b);
//final or gate
or finalor(carryout, bcandout, acandout, abandout);
endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
//behavioralFullAdder adder (sum, carryout, a, b, carryin);
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
