
module smpl_cpu2(input clk, reset, start, output rd_mem, wr_mem, output [12:0] im_abus, input [15:0] im_dbus,
  output [12:0] dm_abus, output [15:0] dm_in_dbus, 
  input [15:0] dm_out_dbus);

  wire [2:0] opcode;
  wire [1:0] ac_src,  pc_src;
  wire ld_ac, zero_ac, alu_op;
  DataPath2 dpu ( reset, ld_ac, clk, alu_op, ac_src, pc_src, opcode, im_abus, im_dbus, dm_abus, dm_out_dbus, dm_in_dbus, zero_ac);
  Controller2 cu2(opcode, zero_ac, start, rd_mem, wr_mem, ld_ac, alu_op, ac_src, pc_src);

endmodule
