//`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"

class environment;
  
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scb;
  mailbox #(transaction) gen2driv;
  mailbox #(transaction) mon2scb;
  virtual intf vif;
  //functional_coverage f;
  //event ok;
  
  function new(virtual intf vif);
    this.vif = vif;
    gen2driv = new();
    mon2scb = new();
    gen = new(gen2driv);
    driv = new(vif, gen2driv);
    mon = new(vif, mon2scb);
    scb = new(mon2scb);
    //f = new(vif);
  endfunction
  
  task test();
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
      //scb.displayCoverage();
      //f.run();
    join
  endtask: test
  
  task run;
    //scb.ok = ok;
    //f.ok = ok;
    
    test();
    $finish;
  endtask: run

endclass: environment
