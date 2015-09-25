module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
  // Your multiplexer code here
wire na0, na1;
//inverters for the select inputs
not na0inv(na0, address0);
not na1inv(na1, address1);
//ands for the actual outputs, these will have 3 inputs apiece
wire and0wire, and1wire, and2wire, and3wire;
and in0and(and0wire, na0, na1, in0);
and in1and(and1wire, address0, na1, in1);
and in2and(and2wire, na0, address1, in2);
and in3and(and3wire, address0, address1, in3);
//final or gate with 4 inputs
or finalor(out, and0wire, and1wire, and2wire, and3wire);

endmodule


module testMultiplexer;
  // Your test code here
reg addr0, addr1;
reg in0, in1, in2, in3;
wire out;
//behavioralMultiplexer mux (out, addr0, addr1, in0, in1, in2, in3);
structuralMultiplexer mux (out, addr0, addr1, in0, in1, in2, in3);

initial begin
$display("A0 A1 | in0 in1 in2 in3| O | Expected Output");
addr0=0;addr1=0;in0=0;in1=1'bX;in2=1'bX;in3=1'bX; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | false", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=0;in0=1;in1=1'bX;in2=1'bX;in3=1'bX; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | true", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=0;in0=1'bX;in1=0;in2=1'bX;in3=1'bX; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | false", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=0;in0=1'bX;in1=1;in2=1'bX;in3=1'bX; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | true", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=1;in0=1'bX;in1=1'bX;in2=0;in3=1'bX; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | false", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=1;in0=1'bX;in1=1'bX;in2=1;in3=1'bX; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | true", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=1;in0=1'bX;in1=1'bX;in2=1'bX;in3=0; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | false", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=1;in0=1'bX;in1=1'bX;in2=1'bX;in3=1; #1000 
$display("%b  %b  |  %b   %b   %b   %b | %b | true", addr0, addr1, in0, in1, in2, in3, out);

end
endmodule
