

module TestSmplCPU2;
  reg clk, reset, start;
  wire [12:0] im_abus, dm_abus;
  wire [15:0] im_dbus, dm_in_dbus, dm_out_dbus;
  
  smpl_cpu2 uut2 (clk, reset, start, rd_mem, wr_mem, im_abus, im_dbus, dm_abus, dm_in_dbus, dm_out_dbus);
  
  InstMemory2 IM2 (im_abus, im_dbus); 
  DataMemory2 DM2 (rd_mem, wr_mem, dm_abus, dm_in_dbus, dm_out_dbus);
  
  initial begin 
    clk = 1'b0;
    start = 1'b1;
    reset = 1'b1;
    #20 reset = 1'b0;
    #500 $finish;
  end
  always #10 clk = ~clk;
endmodule


