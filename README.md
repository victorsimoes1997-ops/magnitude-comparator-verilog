# 4-Bit Magnitude Comparator in Verilog

A robust digital design project implementing a 4-bit Magnitude Comparator in Verilog. This project explores both **Structural/Cascade** modeling (built bottom-up from fundamental 1-bit cells) and **Dataflow** modeling, validated through a dual-model verification testbench.

## 📂 Project Architecture

The system is organized into three core hierarchical layers:

* **`comparador_fundamental` (1-Bit Cell)**: The foundational primitive that evaluates equality (`I`), greater-than (`Ma`), and less-than (`Me`) for a single bit pair.
* **`comparador_4bits` (Dataflow Model)**: A high-level implementation using direct Verilog relational operators (`>`, `<`, `==`). Acts as our behavioral reference (*Golden Model*).
* **`comparador_4bits_cascata` (Structural Cascaded Model)**: A 4-bit ripple-style circuit connecting four foundational cells from the Most Significant Bit (MSB) to the Least Significant Bit (LSB) to propagate priority decisions.

## 🚀 Key Features

* **Hierarchical Bottom-Up Design**: Demonstrates how to scale simple 1-bit logic gates into multi-bit decision-making hardware blocks.
* **Dual-Model Verification (Golden Model Testing)**: The testbench instantiates both the Dataflow and Cascaded models simultaneously, feeding them identical test vectors to verify 100% functional equivalence.
* **Synthesis-Friendly RTL**: Written using clean continuous assignments (`assign`) and standard logic primitives suitable for FPGA and ASIC synthesis flows.

## 🛠️ How to Simulate

1. Open [EDA Playground](https://www.edaplayground.com/).
2. Set the **Language** to `Verilog` and the **Simulator** to `Icarus Verilog`.
3. Paste all the design modules into **Design.sv** and the verification stimulus into **Testbench.sv**.
4. Click **Run** to observe simultaneous execution and log comparisons in the console.# magnitude-comparator-verilog
