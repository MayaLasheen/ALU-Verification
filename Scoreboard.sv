import myPackage::*;

class scoreboard;
  transaction trans;
  mailbox #(transaction) mon2scb;
  
  logic [7:0] out;
  logic carry;
  logic [8:0] tmp;
  
  string p;
  string op;
  
  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;

  endfunction: new
  
  task main;
    repeat(1924)
    begin
      mon2scb.get(trans);   
      tmp = {1'b0,trans.A} + {1'b0,trans.B};
      carry = tmp[8]; // Carryout flag
      case(trans.ALU_Sel)
        4'b0000: // Addition
	begin
           out = trans.A + trans.B ; op = "Addition" ;  
	end
        4'b0001: // Subtraction
	begin
           out = trans.A - trans.B ; op = "Subtraction" ;
	end
        4'b0010: // Multiplication
	begin
           out = trans.A * trans.B; op = "Multiplication" ;
	end
        4'b0011: // Division
	begin
           out = trans.A/trans.B; op = "Division" ;
	end
        4'b0100: // Logical shift left
	begin
           out = trans.A<<1; op = "Logical Shift Left" ;
	end
         4'b0101: // Logical shift right
	begin
           out = trans.A>>1; op = "Logical Shift Right" ;
	end
         4'b0110: // Rotate left
	begin
           out = {trans.A[6:0],trans.A[7]}; op = "Rotate Left" ;
	end
         4'b0111: // Rotate right
	begin
           out = {trans.A[0],trans.A[7:1]}; op = "Rotate Right" ;
	end
          4'b1000: //  Logical and 
	begin
           out = trans.A & trans.B; op = "Logical AND" ;
	end
          4'b1001: //  Logical or
	begin
           out = trans.A | trans.B; op = "Logical OR" ;
	end
          4'b1010: //  Logical xor 
	begin
           out = trans.A ^ trans.B; op = "Logical XOR" ;
	end
          4'b1011: //  Logical nor
	begin
           out = ~(trans.A | trans.B); op = "Logical NOR" ;
	end
          4'b1100: // Logical nand 
	begin
           out = !(trans.A & trans.B); op = "Logical NAND" ;
	end
          4'b1101: // Logical xnor
	begin
           out = ~(trans.A ^ trans.B); op = "Logical XNOR" ;
	end
          4'b1110: // Greater comparison
	begin
           out = (trans.A>trans.B)?8'd1:8'd0 ; op = "Greater Comparison" ;
	end
          4'b1111: // Equal comparison   
	begin
            out = (trans.A==trans.B)?8'd1:8'd0 ; op = "Equal Comparison" ;
	end
          default: 
        begin 
	    out = trans.A + trans.B ; op = "Addition" ;
	end
        endcase

      
      if(out === trans.ALU_Out)
        if(carry === trans.CarryOut) begin
          p = "Test Pass";
	  $display("Successful Operation: %s", op);
          trans.cg.sample();
        end
      	else begin
          p = "Test Fail";
	  $display("Faulty Operation: %s", op);
	end
      else begin
        p = "Test Fail";
       $display("Faulty Operation: %s", op);
      end
       trans.display({"Scoreboard ", p});
       $display("Expected Output: \nALU_Out = %d, CarryOut: %d", out, carry);
       $display("Actual Output: \nALU_Out = %d, CarryOut: %d", trans.ALU_Out, trans.CarryOut);
       $display("*****Coverage***** = %f", trans.cg.get_inst_coverage());
       $display("--------------------------------------");
    end
	  
  endtask: main

endclass: scoreboard
