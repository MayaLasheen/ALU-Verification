import myPackage::*;

class monitor;
  
  virtual intf vif;
  mailbox #(transaction) mon2scb;
  mailbox #(transaction) mon2asrt;
  
  function new (virtual intf vif, mailbox #(transaction) mon2scb, mailbox #(transaction) mon2asrt);
    this.vif = vif;
    this.mon2scb = mon2scb;
    this.mon2asrt = mon2asrt;
  endfunction: new
  
  task main;
    repeat(1924) //1920 Randomized Transactions + 4 Corner Case Transactions
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
            mon2asrt.put(trans);
            trans.display("Monitor");
          end
  endtask
endclass : monitor
