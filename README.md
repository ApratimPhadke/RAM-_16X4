

# 🧠 RAM 16x4 (Verilog HDL)

This repository contains the **Verilog HDL implementation** of a **16x4 Random Access Memory (RAM)** module, complete with **testbench**, **simulation**, and **synthesis results**.
It is designed, simulated, and synthesized using **Xilinx Vivado Design Suite**.

---

## 📌 Project Overview

* **Design Goal**: Implement a parameterized synchronous RAM (16 words × 4 bits).
* **Features**:

  * Configurable data width and depth.
  * Supports **read/write operations** on clock edge.
  * Synthesizable for FPGA targets.
* **Tools Used**:

  * HDL: Verilog
  * Simulation: Vivado XSIM
  * Synthesis: Xilinx Vivado
  * Target FPGA: Any Xilinx FPGA

---

## 🏗️ Architecture

* **Memory Depth**: 16 locations
* **Word Size**: 4 bits per location
* **Inputs**:

  * `clk` – clock signal
  * `write_enable` – controls read/write
  * `addr` – 4-bit address line
  * `data_in` – 4-bit input data
* **Output**:

  * `data_out` – 4-bit output data

### 🔹 Block Diagram

*(Insert your schematic.png here)*

---

## 💻 Verilog Code

### RAM Module (`ram16x4.v`)

```verilog
module ram16x4 #(
    parameter integer DATA_WIDTH = 4,
    parameter integer DEPTH = 16
)(
    input wire clk,
    input wire write_enable,
    input wire [$clog2(DEPTH)-1:0] addr,
    input wire [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);

    reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];

    always @(posedge clk) begin
        if (write_enable)
            memory[addr] <= data_in;
        data_out <= memory[addr];
    end
endmodule
```

### Testbench (`ram16x4_tb.v`)

```verilog
`timescale 1ns/1ps
module ram16x4_tb;

    reg clk, write_enable;
    reg [3:0] addr;
    reg [3:0] data_in;
    wire [3:0] data_out;

    ram16x4 uut (
        .clk(clk),
        .write_enable(write_enable),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock
    end

    initial begin
        $monitor("Time=%0t | WE=%b | Addr=%d | Data_in=%h | Data_out=%h", 
                  $time, write_enable, addr, data_in, data_out);
        
        // Test sequence
        write_enable = 1; addr = 4'd2; data_in = 4'hA; #10;
        write_enable = 1; addr = 4'd5; data_in = 4'hF; #10;
        write_enable = 0; addr = 4'd2; #10;
        write_enable = 0; addr = 4'd5; #10;
        $stop;
    end
endmodule
```

---

## 📊 Simulation Results

### Testbench Waveform

<img width="1001" height="812" alt="testbench2" src="https://github.com/user-attachments/assets/3367179b-34ff-42a2-a7af-c0c2be262d38" />


### TCL Console Output

<img width="1854" height="1168" alt="TCL console" src="https://github.com/user-attachments/assets/2079b7cb-6224-4d4f-a812-6ef8c86ca208" />


---

## ⚙️ Synthesis Results

* **Tool**: Vivado Synthesis
* <img width="1570" height="694" alt="synthesis" src="https://github.com/user-attachments/assets/03ec5318-b99b-4c35-930d-5b3915d97b02" />


---

## 📐 Schematics

* **High-level schematic**: <img width="1854" height="1168" alt="schematic " src="https://github.com/user-attachments/assets/d30be719-d44e-4bbb-9224-7fc889856436" />

* **Detailed schematic**: <img width="1158" height="768" alt="detailed schematic" src="https://github.com/user-attachments/assets/825e5911-70b0-4149-9f36-75b792eeeaa2" />


---

## ⚡ Timing Analysis

<img width="1854" height="1168" alt="timing" src="https://github.com/user-attachments/assets/ad350e5c-dc01-4307-bfd5-cfd94b5463e4" />


* Slack: Positive ✅


---

## 🔋 Power Analysis

<img width="1854" height="1168" alt="power" src="https://github.com/user-attachments/assets/77756b93-3849-4ecf-9b18-a5cc26552318" />


* Static Power: 0.073 mW 
* Dynamic Power: 1.041 mW

---

## 🚀 How to Run

1. Clone the repo:

   ```bash
   git clone https://github.com/ApratimPhadke/RAM16x4.git
   cd RAM16x4
   ```
2. Open in **Xilinx Vivado**.
3. Run **simulation** → Verify results.
4. Run **synthesis & implementation** → Generate bitstream.

---

## 📌 Applications

* Small memory blocks in **FPGA-based systems**.
* Storage elements in **digital processors**.
* **Cache and buffer** implementations in embedded systems.

---

## 📢 Future Improvements

* Add **dual-port RAM**.
* Implement **asynchronous read/write**.
* Extend to **parameterized depth & width** for scalability.

---

## ✨ Author

👤 **Apratim Phadke**
📧 apratimphadkeprime@gmail.com
🔗 github.com/ApratimPhadke

---

