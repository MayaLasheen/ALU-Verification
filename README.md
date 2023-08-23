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
120 randomized transactions were generated for each ALU Operation; furthermore, 2 extra transactions were manually generated for each ALU Operation to test the desired corner cases, which were not reached by the randomized transactions, as the assertion coverage summary had shown initially.
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
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/5feb62ff-83e3-4a40-a5cd-75eb27b8653f" alt="HTML Coverage Report"/></kbd></p> 

<p align = "center"><b>Covergroup Coverage Summary</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/88ae1a9c-4a6b-4534-9557-44187424257d"/></kbd></p>

<p align = "center"><b>Operation Code Coverage Details</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/55163dd6-c535-4103-aaa3-718640e156ad" alt="Operation Code Coverage Details"/></kbd></p>

<p align = "center"><b>Assertions Coverage Summary</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/12df047e-1c98-44ea-a00f-4f16e9ad4cb8" alt="Assertions Coverage Summary"/></kbd></p>

<p align = "center"><b>Detailed Coverage Report</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/8a2f25e7-572f-471c-a15f-14b4cf370810" alt="Detailed Coverage Report 1"/></kbd></p>

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/4901c3dc-286b-4d06-8249-5e6bdaa05ac8" alt="Detailed Coverage Report 2"/></kbd></p>
