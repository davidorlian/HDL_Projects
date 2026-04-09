# HDL_Projects

Collection of **Verilog** and **VHDL** digital design modules, testbenches, and supporting documentation.

This repository brings together small-to-medium HDL building blocks used for learning, simulation, and design practice, including sequential logic, combinational logic, counters, registers, UART-related work, and basic datapath components.

---

## Highlights

### Verilog
- **CD74AC174** – HDL implementation/practice around a hex D-type flip-flop/register device
- **D Flip Flop** – basic sequential building block
- **Register 8 bit** – parallel storage element
- **counter 8 bit** – basic binary counter
- **counter 8 bit reload** – counter with reload capability
- **counter register 8 bit** – combined counter/register-style logic
- **UART** – serial communication related design work
- **monostable_RC** – timing / pulse-related logic exploration

### VHDL
- **alu** – arithmetic and logic unit concepts
- **and_gate** – basic combinational logic
- **decoder** – decoding logic
- **demux** – demultiplexer
- **mux** – multiplexer

---

## Verification / Workflow

Projects in this repository are organized as HDL modules with accompanying testbenches and documentation where relevant.

Typical workflow includes:
- writing RTL in Verilog or VHDL
- simulating behavior with testbenches
- reviewing waveforms and functional behavior
- keeping supporting notes / diagrams / helper scripts

---

## Repository Structure

- `Verilog/` – Verilog modules and related testbenches
- `VHDL/` – VHDL modules and related testbenches
- `docs/` – notes, diagrams, and supporting documentation
- `scripts/` – helper/build/synthesis scripts where applicable

---

## Purpose

This repository is intended to document hands-on work in:
- digital design fundamentals
- RTL implementation
- simulation and debugging
- reusable hardware building blocks
