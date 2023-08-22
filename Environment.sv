`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Assertions.sv"

class environment;
  
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scb;
  assertions asrt;
  mailbox #(transaction) gen2driv;
  mailbox #(transaction) mon2scb;
  mailbox #(transaction) mon2asrt;
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    gen2driv = new();
    mon2scb = new();
    mon2asrt = new();
    gen = new(gen2driv);
    driv = new(vif, gen2driv);
    mon = new(vif, mon2scb, mon2asrt);
    scb = new(mon2scb);
    asrt = new(mon2asrt);
  endfunction
  
  task test();
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
      asrt.main();
    join
  endtask: test
  
  task run;
    test();
    $finish;
  endtask: run

endclass: environment
