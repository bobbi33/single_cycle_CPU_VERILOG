

module Controller2 (input [2:0] opcode, input zero_ac, start, output reg rd_mem, wr_mem, ld_ac, alu_op,
 output reg [1:0]ac_src, pc_src  );
  
  always @(opcode) begin 
    rd_mem = 1'b0;  wr_mem = 1'b0;
    ac_src = 2'b00;  ld_ac  = 1'b0;
    pc_src = 2'b00;
    
    case (opcode)
      3'b000:
      begin
        rd_mem = 1'b1;
        ac_src = 2'b01;
        ld_ac = 1'b1;
      end
      3'b001: wr_mem = 1'b1;
      3'b010: 
      begin 
        rd_mem = 1'b1;
        ac_src = 2'b00;
        ld_ac = 1'b1;
        alu_op = 1'b0;
      end
      3'b011: 
      begin 
        rd_mem = 1'b1;
        ac_src = 2'b00;
        ld_ac = 1'b1;
        alu_op = 1'b1;
      end
      3'b100:
        pc_src = 2'b01;
      3'b101:
      begin
        if (zero_ac == 1'b1)
          pc_src = 2'b01;
        else
          pc_src = 2'b00;
      end
      3'b110:
      begin
        ac_src = 2'b10;
        ld_ac = 1'b1;
      end
      3'b111: 
      if (start == 1'b0)
        pc_src = 2'b10;
      else
        pc_src = 2'b00;
      
    endcase
  end
endmodule
