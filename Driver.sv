//`include "Transaction.sv"
`include "Interface.sv"
import myPackage::*;

class driver;
  virtual intf vif;
  //virtual clk_interface vcif;
  mailbox #(transaction) gen2driv;
  //event drv_done;
  //event monitor_done [4];
  
  function new(virtual intf vif, mailbox #(transaction) gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction: new
  
  task main;
    //int i = 0;
    //#1
    repeat(1920)
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
          //->drv_done;
          //@monitor_done(i);
      	  //i++;
    end
  endtask: main
endclass: driver
