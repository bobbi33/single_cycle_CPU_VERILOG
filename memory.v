
module InstMemory2 (input [12:0] abus, output reg [15:0] dbus);
  
  reg [15:0] im_array [0:1023];
  always @(abus) dbus = im_array[abus];
  
  initial begin 
    im_array [0]  = 16'h0000; // LDA, dm[0] = 5 in AC, Ac = 5
    im_array [1]  = 16'h4001; // ADD, add AC with dm[1], AC= 5 + 1 = 6
    im_array [2]  = 16'h2002; // STA, store Ac in dm[2], dm[2] = 6
    im_array [3]  = 16'h6003; // SUB, Sub AC from dm[3], AC = 6-6 = 0;
    im_array [4]  = 16'hA007; // JEZ, jump to address 7 if AC = 0;
    im_array [5]  = 16'h0000;
    im_array [6]  = 16'h0000;
    im_array [7]  = 16'hC00B; // LDI, load 16'h000B in AC
    im_array [8]  = 16'h2004; // STA, store Ac in dm[4], dm[4] = 16'h000B
    im_array [9] = 16'hE000;  // Halt, hlat the system until start
    im_array [10] = 16'h8000; // JMP 0, jump to address 0 an all the above operations are executed again.
    
    
  end
endmodule 

//

module DataMemory2 (input rd, wr, input [12:0] abus, input [15:0] in_dbus, output reg [15:0] out_dbus);
  reg [15:0] dm_array [0:1023];
  
  always @(rd or abus)
    if (rd) out_dbus = dm_array [abus];
      
  always @ (wr or abus or in_dbus)
      if (wr) dm_array[abus] = in_dbus;
        
  initial begin 
	dm_array[0] = 16'h0005; 
	dm_array[1] = 16'h0001; 
	dm_array[2] = 16'h0000; 
	dm_array[3] = 16'h0006; 
	dm_array[4] = 16'h0000;
	dm_array[5] = 16'h0000; 
	dm_array[6] = 16'h0000; 
	dm_array[7] = 16'h0000; 
	dm_array[8] = 16'h0000; 
	dm_array[9] = 16'h0000;
	dm_array[10] = 16'h0000; 
	dm_array[11] = 16'h0000; 
	dm_array[12] = 16'h0000;
  end
endmodule
  
  
  
  


