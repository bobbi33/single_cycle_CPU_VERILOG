module PC (input [12:0] d_in, input reset, clk, output reg [12:0] d_out);
  always @(posedge clk)
    if (reset) d_out <= 0; else d_out <= d_in; 
endmodule

//
module AC (input [15:0] d_in, input load, clk, output reg [15:0] d_out, output zero);
  always @(posedge clk)
    if (load) d_out <= d_in;
  assign  zero = (d_out == 16'h0000)? 1:0;
endmodule

//
    
module ALU (input [15:0] a, b, input op, output reg [15:0] alu_out);
  always @(a or b or op)begin
  if (op == 1'b0)
    alu_out = a + b;
  else if (op == 1'b1)
    alu_out = a - b;
  end
endmodule

//

module ADDER (input [12:0] a, b, output [12:0] adder_out);
  assign adder_out = a+b;
endmodule

//

module MUX4TO1_13B (input [12:0] i0, i1, i2, i3, input [1:0] sel, output [12:0] mux_out);
  assign mux_out = (sel==2'b00)? i0: (sel== 2'b01)? i1 : (sel == 2'b10)? i2: i3;
endmodule

//
module MUX4TO1_16B (input [15:0] i0, i1, i2, i3, input [1:0] sel, output [15:0] mux_out);
  assign mux_out = (sel==2'b00)? i0: (sel== 2'b01)? i1 : (sel == 2'b10)? i2: i3;
endmodule
