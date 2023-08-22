`include "test.sv"
`include "ALU.sv"

module testbench();
  
  intf i_intf();
  
  test t(i_intf);
  
  ALU dut (.A(i_intf.A),
           .B(i_intf.B),
           .ALU_Sel(i_intf.ALU_Sel),
           .ALU_Out(i_intf.ALU_Out),
           .CarryOut(i_intf.CarryOut));
  
endmodule

