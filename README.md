# ALU_Verification
<p = "justify">A testbench was implemented using  verification methodology, for verifying an ALU RTL to ensure that the ALU functions correctly and reliably, and to detect the present bugs if any.</p>
<p = "justify">The ALU has 3 inputs and 2 outputs.</p>
<p = "justify">
<b>Inputs</b> 
  <ul>
  <li><i>A</i>: First Operand (8-Bit)</li>
  <li><i>B</i>: Second Operand (8-Bit)</li>
  <li><i>ALU_Sel</i>: Selection Line (4-Bit)</li>
  </ul>
  </p>
<p = "justify">
<b>Oututs</b> 
  <ul>
  <li><i>ALU_Out</i>: ALU Output (8-Bit)</li>
  <li><i>CarryOut</i>: Carry Out Flag (1-Bit)</li>
  </ul>
  </p>
<p = "justify">The ALU (Device Under Test) had 3 bugs, namely Subtraction,  Logical OR and Logical NAND operations, which were detected using the testbench.</p>
