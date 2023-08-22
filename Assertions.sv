import myPackage::*;

class assertions;
  transaction trans;
  mailbox #(transaction) mon2asrt;
 
  logic carry;
  logic [8:0] tmp;
  
  function new(mailbox #(transaction) mon2asrt);
    this.mon2asrt = mon2asrt;
  endfunction: new
  
  task main;
    repeat(1924)
    begin
      mon2asrt.get(trans); 
      Corner_Case_1: assert (trans.A == 0 && trans.B == 0) $display("Corner Case 1 is Tested"); else ;
      Corner_Case_2: assert (trans.A == 255 && trans.B == 255) $display("Corner Case 2 is Tested"); else ;
      tmp = {1'b0,trans.A} + {1'b0,trans.B};
      carry = tmp[8]; // Carryout flag
      Carry_Out: assert (trans.CarryOut == carry) $display("Carry Out Assertion Passed"); else $display("Carry Out Assertion Failed");
      case(trans.ALU_Sel)
        4'b0000: // Addition	 
           Addition: assert (trans.ALU_Out == trans.A + trans.B) $display("Addition Assertion Passed"); else $display("Addition Assertion Failed");
	
        4'b0001: // Subtraction	
           Subtraction: assert (trans.ALU_Out == trans.A - trans.B) $display("Subtraction Assertion Passed"); else $display("Subtraction Assertion Failed");
	
        4'b0010: // Multiplication	
           Multiplication: assert (trans.ALU_Out == trans.A * trans.B) $display("Multiplication Assertion Passed"); else $display("Multiplication Assertion Failed");
	
        4'b0011: // Division	
           Division: assert (trans.ALU_Out === trans.A / trans.B) $display("Division Assertion Passed"); else $display("Division Assertion Failed");
	
        4'b0100: // Logical shift left	
           Logical_Shift_Left: assert (trans.ALU_Out == trans.A<<1) $display("Logical Shift Left Assertion Passed"); else $display("Logical Shift Left Assertion Failed");
	
         4'b0101: // Logical shift right	
           Logical_Shift_Right: assert (trans.ALU_Out == trans.A>>1) $display("Logical Shift Right Assertion Passed"); else $display("Logical Shift Right Assertion Failed");
	
         4'b0110: // Rotate left	
           Rotate_Left: assert (trans.ALU_Out == {trans.A[6:0],trans.A[7]}) $display("Rotate Left Assertion Passed"); else $display("Rotate Left Assertion Failed");
	
         4'b0111: // Rotate right	
           Rotate_Right: assert (trans.ALU_Out == {trans.A[0],trans.A[7:1]}) $display("Rotate Right Assertion Passed"); else $display("Rotate Right Assertion Failed");
	
          4'b1000: //  Logical and 	
           Logical_AND: assert (trans.ALU_Out == (trans.A & trans.B)) $display("Logical AND Assertion Passed"); else $display("Logical AND Assertion Failed");
          
	  4'b1001: //  Logical or
           Logical_OR: assert (trans.ALU_Out == (trans.A | trans.B)) $display("Logical OR Assertion Passed"); else $display("Logical OR Assertion Failed");
	
          4'b1010: //  Logical xor 
           Logical_XOR: assert (trans.ALU_Out == (trans.A ^ trans.B)) $display("Logical XOR Assertion Passed"); else $display("Logical XOR Assertion Failed");
	
          4'b1011: //  Logical nor
           Logical_NOR: assert (trans.ALU_Out == ~(trans.A | trans.B)) $display("Logical NOR Assertion Passed"); else $display("Logical NOR Assertion Failed");
	
          4'b1100: // Logical nand 
           Logical_NAND: assert (trans.ALU_Out == ~(trans.A & trans.B)) $display("Logical NAND Assertion Passed"); else $display("Logical NAND Assertion Failed");
	
          4'b1101: // Logical xnor
           Logical_XNOR: assert (trans.ALU_Out == ~(trans.A ^ trans.B)) $display("Logical XNOR Assertion Passed"); else $display("Logical XNOR Assertion Failed");
	
          4'b1110: // Greater comparison
           Greater_Comparison: assert (trans.ALU_Out == ((trans.A>trans.B)?8'd1:8'd0)) $display("Greater Comparison Assertion Passed"); else $display("Greater Comparison Assertion Failed");
	
          4'b1111: // Equal comparison   
           Equal_Comparison: assert (trans.ALU_Out == ((trans.A==trans.B)?8'd1:8'd0)) $display("Equal Comparison Assertion Passed"); else $display("Equal Comparison Assertion Failed");
	
          default: 
           Default: assert (trans.ALU_Out == trans.A + trans.B) $display("Addition Assertion Passed"); else $display("Addition Assertion Failed");
	
        endcase
     
    end
  endtask: main
  
  


endclass: assertions
