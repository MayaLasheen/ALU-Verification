<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="Format.css">
</head>
<body>
<h1>Hyper-Dimensional Biosignal Classifier for EMG Hand-Gesture Recognition</h1>

<h2>Table of Contents</h2>
<ul>
    <li><a href="#Description">Description</a></li>
    <li><a href="#Structure">File Structure</a>
    <ul>
        <li><a href="#IM">Item Memory</a></li>
        <li><a href="#E1">Encoder 1</a></li>
        <li><a href="#E2">Encoder 2</a></li>
        <li><a href="#AM">Associative Memory</a></li>
    </ul>
    </li>
    
</ul>

<h2 id="Description">Description</h2>
<p align = "justify">This project implements a hand gesture recognition system using Verilog hardware description language (HDL). 
    It leverages hyperdimensional computing (HDC) principles to recognize hand gestures based on input Electromyography
    (EMG) signals from sensors.</p>
<h2 id="Structure">File Structure</h2>
    <!--<p>HDC.v: Main Verilog Module.</p>
    <p>It consists of the following modules:
    <ul><li>Item Memory: </li>
    <li>Encoder_1.v & Enocder_2.v: Verilog modules for encoding input gesture patterns into hyperdimensional vectors.
        Each encoder consists of the following modules:
        <ul><li><i>HLU Pipeline</i> which consists of <i>HLU Layers</i> which consist of <i>Hyper-Dimensional Logic Units (HLUs)</i>.</li>
            <li>Accumulator</li>
        </ul></li>
    <li>Assoviative_Memory: </li>
</ul></p> -->

<!--<h2>Block Diagrams</h2>-->
<ul>
    <li><h4 id="IM"><strong>Item Memory</strong></h4></li>
    <p align = "justify">It stores 1024 pre-generated random vectors of 2048 bits in Read-Only Memories (ROMs).
       Each vector in Item Memory is distributed across 16 ROMs. Each ROM was instantiated as an array of size 1024 with a word-size of 128-bits.
       16 ROMs were concatenated together to get a total width of 2048 to be able to store the hyper-dimensionals vector.
    </p>

    <li><h4 id="E1"><strong>Encoder 1</strong></h4></li>

    <ul><li><h4>First Implementation</h4></li>
    <img src="C:\My Laptop\University\Semester 8\To Do List\Block Diagrams\Encoder 1.png" class="center_1"></img>
    <li><h4>Second Implementation "Better"</h4></li>
    <img src="C:\My Laptop\University\Semester 8\To Do List\Block Diagrams\Modified_Encoder_1.png" class="center_1"></img></ul></li>

    <li><h4 id="E2"><strong>Encoder 2</strong></h4></li>
    <img src="C:\My Laptop\University\Semester 8\To Do List\Block Diagrams\Encoder 2.jpg" class="center_3"></img>

    </br></br>

    <p align = "justify">Each <i>Encoder</i> consists of the following modules: <i><a href="#Pipe">HLU Pipeline</a></i> and an <i><a href="#Acc">Accumulator</a></i>.<br>
    These modules, along with their corresponding block diagrams, are presented in the following section.</p>

    <ul>
    <li><h4 id="Pipe"><strong>HLU Pipeline</strong></h4></li>
    <p align = "justify"></p>It consists of several HLU Layers pipelined together where each layer is made of D Hyper-Dimensional Logic Units.</p>
    <ul>
        <li><h4>Hyper-Dimensional Logic Unit (HLU)</h4></li>
        <p align = "justify">It takes 2 single-bit operands, A and B. It can multiply (C = A ⊕ B), delay (C = A) and permute-and-multiply 
            (C = A ⊕ ρ(B)) according to the values of ‘op’ and ‘permute’ signals.</p>
        <img src="C:\My Laptop\University\Semester 8\To Do List\Block Diagrams\HLU.png" class="center_1"></img>

        <li><h4>HLU Layer</h4></li>
        <p align = "justify">D Hyper-Dimensional Units are connected together to form the ‘HLU Layer’ which can operate on entire hypervectors (D: dimension of the hyper-dimensional vector). 
            It takes 2 hyper-dimensional vectors A and B and performs operation on them to output hyper-dimensional vector C.</p>
        <img src="C:\My Laptop\University\Semester 8\To Do List\Block Diagrams\HLU Layer.png" class="center_2"></img>

        <li><h4>HLU Pipeline</h4></li>
        <p align = "justify">It conists of several HLU Layers pipelined together as shown in the block diagram.</p>
        <img src="C:\My Laptop\University\Semester 8\To Do List\Block Diagrams\HLU Pipeline.png" class="center_1"></img>  
        <h4>The first encoder pipelines 2 HLU Layers, while the second encoder pipelines 7 HLU Layers.

        </h4>   
    </ul>


    <li><h4 id="Acc"><strong>Accumulator</strong></li></h4>
    <p align = "justify">It is connected to the output of the pipeline for superposition. It consists of D 2's complement counters which can either decrement
        or decrement according to the value of 'direction' signal.
    </p>
    <p align = "justify">ENABLEREG is programmed to mark the cycles of arrival of required terms and enable the counters for accumulation.</p>
    <p align = "justify">Output is the vector formed by counters' Most Significant Bits (MSBs) i.e. thresholded at 0.</p>
    <img src="C:\My Laptop\University\Semester 8\To Do List\Block Diagrams\Accumulator.png" class="center_2"></img>
</ul>
    
    
    <li><h4 id="AM"><strong>Associative Memory</strong></h4></li>
    <p align = "justify"></p>

</ul>
</body>
</html>
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
<p align = "justify">
As a result of manually adding the <i>division by 0</i> corner case (B=0 and ALU_Sel=0 ), the illegal_bin feature was tested and the following error occured.
</p>
<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/88ad6882-319f-4403-b277-f04f38d0ca56" alt="Illegal Bin"/></kbd>
</p>

<b>Coverage</b>
<p align = "justify">  
The HTML coverage report as well as detailed coverage report were generated to analyze the coverage. The detailed coverage report was generated using the <i>coverage report -detail</i> command option. The rest of the cross coverage section in the detailed report is omitted from the provided screenshots due to its extensive length.
</p>

<p align = "center"><b>HTML Coverage Report</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/fbe399f5-2837-43d4-bb52-ed7d9407f611" alt="HTML Coverage Report"/></kbd></p> 

<p align = "center"><b>Covergroup Coverage Summary</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/0e99c5c9-937c-45d2-8eef-809eed68028e"/></kbd></p>

<p align = "center"><b>Operation Code Coverage Details</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/55163dd6-c535-4103-aaa3-718640e156ad" alt="Operation Code Coverage Details"/></kbd></p>

<p align = "center"><b>Assertions Coverage Summary</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/12df047e-1c98-44ea-a00f-4f16e9ad4cb8" alt="Assertions Coverage Summary"/></kbd></p>

<p align = "center"><b>Detailed Coverage Report</b>
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/af288fa8-fcea-4441-8097-682808aed1bc" alt="Detailed Coverage Report 1"/></kbd></p>

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/713f932d-70e9-4730-9a30-3f550af83f3b" alt="Detailed Coverage Report 2"/></kbd></p>

<p align = "center">
<kbd><img src="https://github.com/MayaLasheen/ALU-Verification/assets/137602736/10115be8-335d-4be9-a666-8b3627e9a6d8" alt="Division by 0"/></kbd></p>
