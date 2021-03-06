//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

//make the decoder and wire it
wire[31:0] decoderout;
decoder1to32 decoder(decoderout, RegWrite, WriteRegister);

//need to make 31 regular registers and one zero one
wire[31:0] register0read;
register32zero register0(register0read, WriteData, decoderout[0], Clk);

//make all the regular registers and their wires
wire[31:0] register1read; 
register32 register1(register1read, WriteData, decoderout[1], Clk); 
wire[31:0] register2read; 
register32 register2(register2read, WriteData, decoderout[2], Clk); 
wire[31:0] register3read; 
register32 register3(register3read, WriteData, decoderout[3], Clk); 
wire[31:0] register4read; 
register32 register4(register4read, WriteData, decoderout[4], Clk); 
wire[31:0] register5read; 
register32 register5(register5read, WriteData, decoderout[5], Clk); 
wire[31:0] register6read; 
register32 register6(register6read, WriteData, decoderout[6], Clk); 
wire[31:0] register7read; 
register32 register7(register7read, WriteData, decoderout[7], Clk); 
wire[31:0] register8read; 
register32 register8(register8read, WriteData, decoderout[8], Clk); 
wire[31:0] register9read; 
register32 register9(register9read, WriteData, decoderout[9], Clk); 
wire[31:0] register10read; 
register32 register10(register10read, WriteData, decoderout[10], Clk); 
wire[31:0] register11read; 
register32 register11(register11read, WriteData, decoderout[11], Clk); 
wire[31:0] register12read; 
register32 register12(register12read, WriteData, decoderout[12], Clk); 
wire[31:0] register13read; 
register32 register13(register13read, WriteData, decoderout[13], Clk); 
wire[31:0] register14read; 
register32 register14(register14read, WriteData, decoderout[14], Clk); 
wire[31:0] register15read; 
register32 register15(register15read, WriteData, decoderout[15], Clk); 
wire[31:0] register16read; 
register32 register16(register16read, WriteData, decoderout[16], Clk); 
wire[31:0] register17read; 
register32 register17(register17read, WriteData, decoderout[17], Clk); 
wire[31:0] register18read; 
register32 register18(register18read, WriteData, decoderout[18], Clk); 
wire[31:0] register19read; 
register32 register19(register19read, WriteData, decoderout[19], Clk); 
wire[31:0] register20read; 
register32 register20(register20read, WriteData, decoderout[20], Clk); 
wire[31:0] register21read; 
register32 register21(register21read, WriteData, decoderout[21], Clk); 
wire[31:0] register22read; 
register32 register22(register22read, WriteData, decoderout[22], Clk); 
wire[31:0] register23read; 
register32 register23(register23read, WriteData, decoderout[23], Clk); 
wire[31:0] register24read; 
register32 register24(register24read, WriteData, decoderout[24], Clk); 
wire[31:0] register25read; 
register32 register25(register25read, WriteData, decoderout[25], Clk); 
wire[31:0] register26read; 
register32 register26(register26read, WriteData, decoderout[26], Clk); 
wire[31:0] register27read; 
register32 register27(register27read, WriteData, decoderout[27], Clk); 
wire[31:0] register28read; 
register32 register28(register28read, WriteData, decoderout[28], Clk); 
wire[31:0] register29read; 
register32 register29(register29read, WriteData, decoderout[29], Clk); 
wire[31:0] register30read; 
register32 register30(register30read, WriteData, decoderout[30], Clk); 
wire[31:0] register31read; 
register32 register31(register31read, WriteData, decoderout[31], Clk); 

//now we need to make the multiplexors
mux32to1by32 mux1( ReadData1, ReadRegister1, 
register0read, 
register1read, 
register2read, 
register3read, 
register4read, 
register5read, 
register6read, 
register7read, 
register8read, 
register9read, 
register10read, 
register11read, 
register12read, 
register13read, 
register14read, 
register15read, 
register16read, 
register17read, 
register18read, 
register19read, 
register20read, 
register21read, 
register22read, 
register23read, 
register24read, 
register25read, 
register26read, 
register27read, 
register28read, 
register29read, 
register30read, 
register31read);

mux32to1by32 mux2( ReadData2, ReadRegister2, 
register0read, 
register1read, 
register2read, 
register3read, 
register4read, 
register5read, 
register6read, 
register7read, 
register8read, 
register9read, 
register10read, 
register11read, 
register12read, 
register13read, 
register14read, 
register15read, 
register16read, 
register17read, 
register18read, 
register19read, 
register20read, 
register21read, 
register22read, 
register23read, 
register24read, 
register25read, 
register26read, 
register27read, 
register28read, 
register29read, 
register30read, 
register31read);

endmodule

// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

//32 bit register
module register32
(
output[31:0] q,
input[31:0] d, 
input wrenable,
input clk
);
//now to generate 32 1 bit registers using a generate statement
generate
genvar i;
for(i=0;i<32;i=i+1) begin
	register oneReg(q[i],d[i],wrenable,clk);
end
endgenerate

endmodule

module register32zero
(
output[31:0] q,
input[31:0] d,
input wrenable,
input clk
);
assign q = 0;
endmodule

module mux32to1by1
(
output      out,
input[4:0]  address,
input[31:0] inputs
);

assign out=inputs[address];
endmodule

module mux32to1by32
(
output[31:0]    out,
input[4:0]      address,
input[31:0]    
input0, 
input1, 
input2, 
input3, 
input4, 
input5, 
input6, 
input7, 
input8, 
input9, 
input10, 
input11, 
input12, 
input13, 
input14, 
input15, 
input16, 
input17, 
input18, 
input19, 
input20, 
input21, 
input22, 
input23, 
input24, 
input25, 
input26, 
input27, 
input28, 
input29, 
input30, 
input31 
);

  wire[31:0] mux[31:0];         // Create a 2D array of wires
  assign mux[0] = input0;       // Connect the sources of the array
assign mux[1] = input1; 
assign mux[2] = input2; 
assign mux[3] = input3; 
assign mux[4] = input4; 
assign mux[5] = input5; 
assign mux[6] = input6; 
assign mux[7] = input7; 
assign mux[8] = input8; 
assign mux[9] = input9; 
assign mux[10] = input10; 
assign mux[11] = input11; 
assign mux[12] = input12; 
assign mux[13] = input13; 
assign mux[14] = input14; 
assign mux[15] = input15; 
assign mux[16] = input16; 
assign mux[17] = input17; 
assign mux[18] = input18; 
assign mux[19] = input19; 
assign mux[20] = input20; 
assign mux[21] = input21; 
assign mux[22] = input22; 
assign mux[23] = input23; 
assign mux[24] = input24; 
assign mux[25] = input25; 
assign mux[26] = input26; 
assign mux[27] = input27; 
assign mux[28] = input28; 
assign mux[29] = input29; 
assign mux[30] = input30; 
assign mux[31] = input31; 
  assign out = mux[address];    // Connect the output of the array
endmodule


// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address; 

endmodule
