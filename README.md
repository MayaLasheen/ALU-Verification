# ALU Verification
<p align = "justify">A testbench was implemented in SystemVerilog langauge on Mentor QuestaSim using the verification methodology in order to verify an ALU RTL to ensure that the ALU functions correctly and reliably, and to detect the present bugs, if any.</p>
<p align = "justify">The ALU has 3 input ports and 2 output ports.</p>
<p align = "justify">
Inputs:
  <ul>
  <li><i>A</i>: First Operand (8-Bit)</li>
  <li><i>B</i>: Second Operand (8-Bit)</li>
  <li><i>ALU_Sel</i>: Selection Line (4-Bit)</li>
  </ul>
  </p>
<p align = "justify">
Outputs:
  <ul>
  <li><i>ALU_Out</i>: ALU Output (8-Bit)</li>
  <li><i>CarryOut</i>: Carry Out Flag (1-Bit)</li>
  </ul>
  </p>
  
<b>Bugs Detection</b>
<p align = "justify">
The ALU (Device Under Test) has 3 bugs, namely Subtraction, Logical OR and Logical NAND operations, which were detected using the testbench as shown in the following screenshots.</p>

<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/96c93014-3ceb-4eb0-8191-a391bd5157d0" alt="Subtraction"/></kbd>

<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/48a7d366-35ae-4ebc-a648-1aa59a133b3d" alt="Logical OR"/></kbd>

<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/8629bd64-7508-4318-8d83-77d098ef2d38" alt="Logical NAND"/></kbd>

<b>Coverage</b>
<p align = "justify">  
The HTML coverage report as well as detailed coverage report were generated. The detailed coverage report was generated using the <i>coverage report -detail</i> command option. It provides a more granular report, including information about uncovered coverage points, and hence helps in detecting the specific areas that need additional test cases or debug efforts. The cross coverage section in the detailed report is omitted from the provided screenshots due to its extensive length.
</p>

<p align = "center"><b>HTML Coverage Report</b>
<kbd><img src="https://github.com/MayaLasheen/ALU_Verification/assets/137602736/29349a1f-1d4c-470a-b6df-4f1c7740a049" alt="HTML Coverage Report"/></kbd></p> 

<p align = "center"><b>Detailed Coverage Report</b>
<kbd><img src="https://github.com/MayaLasheen/ALU_Verification/assets/137602736/cac4a755-d432-437d-b950-a3db0d1c5573" alt="Detailed Coverage Report"/></kbd></p>
