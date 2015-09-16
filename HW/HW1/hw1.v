module hw1test;

//code for ~A~B
reg A; // The input A
reg B; // The input B
wire nA;
wire nB;
wire nAandnB;
not Ainv(nA, A); // top inverter produces signal nA and takes
// signal A, and is named Ainv
not Binv(nB, B); // inverter produces signal nB and takes
// signal B, and is named Binv
and andgate(nAandnB, nA, nB); // and gate produces nAandnB from nA and nB


//code for ~A+~B
wire nA2ornB2;
or orgate2(nA2ornB2, nA, nB); // and gate produces nAandnB from nA and nB

//code for ~(A+B)
wire nA3orB3;
nor orgate3(nA3orB3, A, B); // and gate produces nAorB from A and B

//code for ~(AB)
wire nA4andB4;
nand andgate2(nA4andB4, A, B); // and gate produces nAandB from A and B

//now to add test signals and display outputs
initial begin
$display("A B | ~A ~B | ~A~B | ~A+~B | ~(A+B) | ~(AB) "); // Prints header for truth table
A=0;B=0; #1 // Set A and B, wait for update (#1)
$display("%b %b |  %b  %b |  %b   |   %b   |   %b    |  %b" , A,B, nA, nB, nAandnB, nA2ornB2, nA3orB3, nA4andB4);
A=0;B=1; #1 // Set A and B, wait for new update
$display("%b %b |  %b  %b |  %b   |   %b   |   %b    |  %b" , A,B, nA, nB, nAandnB, nA2ornB2, nA3orB3, nA4andB4);
A=1;B=0; #1
$display("%b %b |  %b  %b |  %b   |   %b   |   %b    |  %b" , A,B, nA, nB, nAandnB, nA2ornB2, nA3orB3, nA4andB4);
A=1;B=1; #1
$display("%b %b |  %b  %b |  %b   |   %b   |   %b    |  %b" , A,B, nA, nB, nAandnB, nA2ornB2, nA3orB3, nA4andB4);
end 

endmodule
