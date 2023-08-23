`include "Interface.sv"
import myPackage::*;

class driver;
  virtual intf vif;
  mailbox #(transaction) gen2driv;
  
  function new(virtual intf vif, mailbox #(transaction) gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction: new
  
  task main;
    repeat(1924)
    begin
          transaction trans;
          gen2driv.get(trans);
          @(posedge vif.clk);
          vif.A <= trans.A;
          vif.B <= trans.B;
          vif.ALU_Sel <= trans.ALU_Sel;
          trans.display("Driver");
          trans.ALU_Out = vif.ALU_Out;
          trans.CarryOut = vif.CarryOut;
    end
  endtask: main
endclass: driver
