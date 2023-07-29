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
  mailbox #(transaction) m1;
  mailbox #(transaction) m2;
  virtual intf vif;
  //functional_coverage f;
  //event ok;
  
  function new(virtual intf vif);
    this.vif = vif;
    m1 = new();
    m2 = new();
    gen = new(m1);
    driv = new(vif, m1);
    mon = new(vif, m2);
    scb = new(m2);
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
