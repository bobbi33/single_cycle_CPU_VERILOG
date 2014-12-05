module DataPath2 ( input reset, ld_ac, clk, alu_op, input [1:0] ac_src, pc_src,
                  output [2:0] opcode,
                  output [12:0] im_abus, 
                  input [15:0] im_dbus, 
                  output [12:0] dm_abus,
                  input [15:0] dm_out_dbus,
                  output [15:0] dm_in_dbus, 
                  output zero_ac);

  wire [15:0] ac_out, alu_out, mux2_out;
  wire [12:0] pc_out, adder_out, mux1_out;

  PC  pc  (mux1_out, reset, clk, pc_out);
  AC  ac  (mux2_out, ld_ac, clk, ac_out, zero_ac);
  ALU alu (ac_out, dm_out_dbus, alu_op, alu_out);
  ADDER adder (pc_out, 13'b0000000000001, adder_out);
  
  MUX4TO1_13B mux1 (adder_out, im_dbus[12:0], pc_out, adder_out, pc_src, mux1_out);
  MUX4TO1_16B mux2 (alu_out, dm_out_dbus, {im_dbus[12],im_dbus[12],im_dbus[12],im_dbus[12:0]}, 
							alu_out, ac_src, mux2_out);
  
  assign opcode  = im_dbus[15:13];
  assign im_abus = pc_out;
  assign dm_abus = im_dbus [12:0];
  assign dm_in_dbus = ac_out;
  
endmodule
