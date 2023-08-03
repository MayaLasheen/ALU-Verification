`include "Transaction.sv"

class generator;
  
  transaction item;
  //event drv_done;
  mailbox #(transaction) gen2driv;
  //event ok;
  
  function new (mailbox #(transaction) gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    int i = 0;
    int j = 0;
    repeat(1920)   
    begin
      transaction item = new;
      if(i%10 == 0) begin
        item.ALU_Sel = j%16;
	item.upper.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 1) begin 
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.upper.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 2) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 3) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 4) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.upper.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 5) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.upper.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 6) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.upper.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 7) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.upper.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 8) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.upper.constraint_mode(0);
	item.mix_lowerMiddleA_upperB.constraint_mode(0);
      end
      if(i%10 == 9) begin
        item.ALU_Sel = j%16;
	item.lower.constraint_mode(0);
        item.lower_middle.constraint_mode(0);
        item.upper_middle.constraint_mode(0);
        item.mix_1owerA_upperB.constraint_mode(0);
        item.mix_upperA_lowerB.constraint_mode(0);
        item.mix_upperMiddleA_lowerMiddleB.constraint_mode(0);
        item.mix_lowerMiddleA_upperMiddleB.constraint_mode(0);
	item.mix_upperA_lowerMiddleB.constraint_mode(0);
	item.upper.constraint_mode(0);
	j++;
      end
      void'(item.randomize());
      item.display("Generator");
      //item.cg.sample();
      //$display("*****Coverage = %f*****", item.cg.get_coverage());
      gen2driv.put(item);
      i=i+1;
      //-> ok;
      //@(drv_done);
    end
  endtask: main
  
  /*task displayCoverage();
    @(ok);
    $display("*****Coverage = %f*****", item.cg.get_coverage());
  endtask*/

endclass: generator
