//`include "Interface.sv"
`include "test.sv"
`include "ALU.sv"

module testbench();
  
  intf i_intf1();
  
  test t1(i_intf1);
  
  ALU dut1 (.A(i_intf1.A),
           .B(i_intf1.B),
           .ALU_Sel(i_intf1.ALU_Sel),
           .ALU_Out(i_intf1.ALU_Out),
           .CarryOut(i_intf1.CarryOut));


  
endmodule

