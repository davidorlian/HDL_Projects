# 8-Bit Programmable Reloadable Counter

This module implements an 8-bit up-counter with programmable auto-reload behavior. It is designed to serve as part of a register-based counter system, where external systems need both access to the current count and control over its periodic behavior.

Unlike a basic counter, this design enables:
- **Internal access and modification** of the counter value
- **Loading of a specific value** into the counter via the `load` input
- **Auto-reload** from a stored value once the counter reaches its maximum (255)
- **Access to the current count** through the `count` output

These capabilities are essential when the counter is expected to be responsive to external configurations, and a basic counter would not suffice.

---

## Module: `cntr_8bit`

### Ports
| Name    | Direction | Width   | Description                                                      |
|---------|-----------|---------|------------------------------------------------------------------|
| `clk`   | input     | 1 bit   | Clock signal                                                     |
| `reset` | input     | 1 bit   | Synchronous reset                                                |
| `load`  | input     | 8 bits  | Value used to calculate initial counter state (`q = 255 - load`) |
| `count` | output    | 8 bits  | Current counter value                                            |
| `tc`    | output    | 1 bit   | Terminal count flag, active when `count == 255`                  |


## Testbench: `tb_cntr`

### Key Features
- Drives `clk`, `reset`, and `load` signals to test the full behavior of the counter.
- Observes `count` and `tc` outputs in real time using `$monitor`.
- Demonstrates:
  - Reset-based loading behavior
  - Auto-reload upon reaching terminal count
  - Load value modification between resets