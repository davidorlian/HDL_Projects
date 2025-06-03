# 8-Bit General Purpose Register
This module implements an 8-bit parallel-in, parallel-out register with synchronous load and asynchronous reset capabilities. It is built using eight individual D-Flip-Flop (DFF) modules, demonstrating a structural approach to register design.

## Module: `register_8bit`
### Ports
| Name       | Direction | Width  | Description                                                                                                  |
|------------|-----------|--------|--------------------------------------------------------------------------------------------------------------|
| `CLK`      | input     | 1 bit  | Clock signal for synchronous operations                                                                      |
| `RST`      | input     | 1 bit  | Asynchronous active-high reset. Clears all register bits to '0'                                              |
| `load`     | input     | 1 bit  | Active-high load enable. When load is high, `data_in` is loaded into the register on the positive clock edge |
| `data_in`  | input     | 8 bits | Parallel input data to be loaded into the register                                                           |
| `data_out` | output    | 8 bits | Parallel output data, representing the current stored value of the register                                  |

### Functionality
The `register_8bit` module comprises eight instances of a D_FF module. Each D-Flip-Flop stores one bit of the 8-bit data.
- **Asynchronous Reset**: When `RST` is high, all DFFs are immediately cleared, setting `data_out` to 8'b0.
- **Synchronous Load**: When `load` is high, the `data_in` is passed to the D inputs of the flip-flops. On the next positive edge of `CLK` (and if `RST` is low), `data_in` is captured and becomes `data_out`.
- **Hold State**: When `load` is low (and `RST` is low), the current `q_output` (the current state of the flip-flops) is fed back to the `d_input` of the flip-flops. This effectively holds the current value in the register on subsequent clock edges.
The `always @(*)` block implements the multiplexing logic for the D-inputs of the flip-flops: if `load` is asserted, `data_in` is selected; otherwise, the current `q_output` is selected to retain the value.

## Testbench: `register_8bit_tb`
This testbench provides stimulus to the `register_8bit` module to verify its functionality.

### Key Features
- **Clock Generation**: Generates a continuous clock signal (`CLK_tb`).
- **Reset Testing**: Tests the asynchronous reset functionality.
- **Load Operation Verification**: Applies various `data_in` values and asserts `lode_tb` to verify that the register loads correctly.
- **Hold Operation Verification**: De-asserts `lode_tb` to ensure the register holds its value.
- **Sequential Loading**: Demonstrates loading different values sequentially to check dynamic behavior.