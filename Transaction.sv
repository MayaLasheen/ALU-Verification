// Code your testbench here
// or browse Examples
class transaction;
  
  rand reg[7:0] A,B;
  reg[3:0] ALU_Sel;
  logic [7:0] ALU_Out;
  logic CarryOut;

  covergroup cg;
    input_1: coverpoint A {
      bins lower = {[0:63]};
      bins lower_middle = {[64:127]};
      bins upper_middle = {[128:191]};
      bins upper = {[192:255]};}
    input_2: coverpoint B {
      bins lower = {[0:63]};
      bins lower_middle = {[64:127]};
      bins upper_middle = {[128:191]};
      bins upper = {[192:255]};}
    op_code: coverpoint ALU_Sel {
      option.at_least = 120;
      bins instructions [16] = {[0:15]};}
    cross_coverage: cross input_1, input_2, op_code;
  endgroup;
  
  function new();
    cg = new();
  endfunction
  
  
  function void display(string name);
    $display("-------------------------");
    $display("%s",name);
    $display("A = %d, B = %d, ALU_Sel = %d", A, B, ALU_Sel);
    $display("ALU_Out = %d, CarryOut = %d", ALU_Out, CarryOut);
    $display("-------------------------");
  endfunction
  
  constraint lower {
					A >= 0;
					A <= 63;
					B >= 0;
					B <= 63;
  }

  constraint lower_middle {
					A >= 64;
					A <= 127;
					B >= 64;
					B <= 127;
  }

  constraint upper_middle {
					A >= 128;
					A <= 191;
					B >= 128;
					B <= 191;
  }

  constraint upper {
					A >= 192;
					A <= 255;
					B >= 192;
					B <= 255;
  }

  constraint mix_1owerA_upperB {
					A >= 0;
					A <= 63;
					B >= 192;
					B <= 255;
  }
  
  constraint mix_upperA_lowerB {
					B >= 0;
					B <= 63;
					A >= 192;
					A <= 255;
  }

  constraint mix_upperMiddleA_lowerMiddleB {
					A >= 128;
					A <= 191;
					B >= 64;
					B <= 127;
  }

  constraint mix_lowerMiddleA_upperMiddleB {
					B >= 128;
					B <= 191;
					A >= 64;
					A <= 127;
  }
  
  constraint mix_lowerMiddleA_upperB {
					B >= 192;
					B <= 255;
					A >= 64;
					A <= 127;
  }

  constraint mix_upperA_lowerMiddleB {
					B >= 64;
					B <= 127;
					A >= 192;
					A <= 255;
  }

  
endclass: transaction
