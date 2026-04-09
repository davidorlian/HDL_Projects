# HDL_Projects

Collection of **Verilog** and **VHDL** digital design modules, testbenches, and supporting documentation.

This repository includes hands-on RTL building blocks developed for digital design practice, simulation, and design exploration.  
It covers both **combinational** and **sequential** logic, including registers, counters, UART-related work, and basic datapath modules.

---

## Module Overview

| Module | Language | Category | Testbench | Notes |
|--------|----------|----------|-----------|-------|
| UART | Verilog | Serial / Sequential | Yes | UART-related logic |
| Register 8 bit | Verilog | Sequential | Yes | Basic storage element |
| counter 8 bit | Verilog | Sequential | Yes | Binary counter |
| counter 8 bit reload | Verilog | Sequential | Yes | Reloadable counter |
| CD74AC174 | Verilog | Sequential | Yes | Register / flip-flop based logic |
| alu | VHDL | Datapath / Combinational | Yes | Arithmetic and logic operations |
| mux | VHDL | Combinational | Yes | Multiplexer |
| demux | VHDL | Combinational | Yes | Demultiplexer |
| decoder | VHDL | Combinational | Yes | Decoder logic |
| and_gate | VHDL | Combinational | Yes | Basic logic gate |

---

## Verification / Workflow

Typical workflow in this repository includes:
- writing RTL in Verilog or VHDL
- creating testbenches
- simulating functional behavior
- reviewing outputs / waveforms
- keeping supporting notes and documentation

---

## Repository Structure

- `Verilog/` – Verilog modules and related files
- `VHDL/` – VHDL modules and related files
- `docs/` – notes, diagrams, and supporting documentation

---

## Purpose

This repository documents practical work in:
- digital logic design
- RTL implementation
- simulation and debugging
- reusable HDL building blocks
