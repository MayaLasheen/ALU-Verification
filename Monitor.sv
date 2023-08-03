//`include "Interface.sv"
//`include "Transaction.sv"
import myPackage::*;

class monitor;
  
  virtual intf vif;
  //virtual clk_interface vcif;
  mailbox #(transaction) mon2scb;
  //event monitor_done [4];
  
  function new (virtual intf vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction: new
  
  task main;
    //int i = 0;
        repeat(1920)
          begin
            transaction trans;
            trans = new();
            @(posedge vif.clk);
            #3
            trans.A = vif.A;
            trans.B = vif.B;
            trans.ALU_Sel = vif.ALU_Sel;
            trans.ALU_Out = vif.ALU_Out;
            trans.CarryOut = vif.CarryOut;
            mon2scb.put(trans);
            trans.display("Monitor");
            //$display("Messages: %d", mon2scb.num());
            //$display("Virtual Interface");
            //$display("A = %d, B = %d, ALU_Sel = %d", vif.A, vif.B, vif.ALU_Sel);
            //->monitor_done(i);
            //i++;
          end
  endtask
endclass : monitor
