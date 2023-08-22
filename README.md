# ALU Verification
<p align = "justify">A complete verification environment (including assertions) was implemented in SystemVerilog langauge on Mentor QuestaSim in order to verify an ALU RTL to ensure that the ALU functions correctly and reliably, and to detect the present bugs, if any.</p>
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
120 randomized transactions were generated for each ALU Operation; furthermore, 4 extra transactions were manually generated to test the desired corner cases, which were not reached by the randomized transactions, as the assertion coverage summary had shown initially.
The ALU DUT (Device Under Test) has 3 bugs, namely Subtraction, Logical OR and Logical NAND operations, which were detected using the testbench by the scoreboard class as well as the assertion results as shown in the following screenshots.</p>
<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/b6a20126-6e7e-40b4-8cdd-5782e11a7194" alt="Subtraction"/></kbd>
</p>
<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/03b86f96-413b-4f29-a651-9dd36e1c172b" alt="Logical OR"/></kbd>
</p>
<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/ff78115f-97dc-481f-a3d6-07d8fd7f8082" alt="Logical NAND"/></kbd>
</p>

<b>Coverage</b>
<p align = "justify">  
The HTML coverage report as well as detailed coverage report were generated to analyze the coverage. The detailed coverage report was generated using the <i>coverage report -detail</i> command option. The rest of the cross coverage section in the detailed report is omitted from the provided screenshots due to its extensive length.
</p>

<p align = "center"><b>HTML Coverage Report</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/db967787-4378-409e-ac37-54b3ea4696a6" alt="HTML Coverage Report"/></kbd></p> 

<p align = "center"><b>Covergroup Coverage Summary</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/aadf15fb-2c81-40b3-867f-2a228bf5ac3b" alt="Covergroup Coverage Summary"/></kbd></p>

<p align = "center"><b>Operation Code Coverage Details</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/94e4d072-c828-40de-a141-fff7cade598a" alt="Operation Code Coverage Details"/></kbd></p>

<p align = "center"><b>Assertions Coverage Summary</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/0274bb89-933a-4695-bde0-67a2dbb1f3c1" alt="Assertions Coverage Summary"/></kbd></p>

<p align = "center"><b>Detailed Coverage Report</b>
<kbd><img src="https://github.com/MayaLasheen/ALU_Verification/assets/137602736/cac4a755-d432-437d-b950-a3db0d1c5573" alt="Detailed Coverage Report 1"/></kbd></p>

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/9520bf0a-7958-4533-8beb-6639057e444d" alt="Detailed Coverage Report 2"/></kbd></p>
