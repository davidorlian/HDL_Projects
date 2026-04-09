# Decoder Implementations
This directory contains Verilog HDL implementations of designing a 4-to-16 decoder using only 2-to-4 decoders.

## Module: `decoder_2to4`
This module implements a basic 2-to-4 decoder with an enable input.

### Ports
| Name     | Direction | Width  | Description                                                                                 |
|----------|-----------|--------|---------------------------------------------------------------------------------------------|
| `enable` | input     | 1 bit  | Active-high enable signal. If enable is low, all out bits are '0'                           |
| `in`     | input     | 2 bits | 2-bit input selecting one of the 4 output lines                                             |
| `out`    | output    | 4 bits | 4-bit output, where exactly one bit is '1' if enable is high, corresponding to the in value |

### Functionality
When enable is high, the decoder activates one of its four output lines based on the 2-bit input in. For example, if in is 2'b00, out[0] will be 1'b1 and all other outputs will be 1'b0. If enable is low, all out bits are 1'b0.

## Module: `decoder_4to16`
This module implements a 4-to-16 decoder by instantiating multiple `decoder_2to4` modules, demonstrating hierarchical design.

### Ports
| Name     | Direction | Width   | Description                                                                                  |
|----------|-----------|---------|----------------------------------------------------------------------------------------------|
| `enable` | input     | 1 bit   | Master enable signal                                                                         |
| `in`     | input     | 4 bits  | 4-bit input selecting one of the 16 output lines                                             |
| `out`    | output    | 16 bits | 16-bit output, where exactly one bit is '1' if enable is high, corresponding to the in value |

### Functionality
The `decoder_4to16` uses a "tree" structure of `decoder_2to4` modules. The two most significant bits of in (in[3:2]) control an initial `decoder_2to4` to select which of four groups of outputs is enabled. The two least significant bits (in[1:0]) then control a second level of `decoder_2to4` modules within the selected group to activate the specific output line. The overall enable signal gates the entire operation.

### Testbenches
`tb_decoder_2to4.v`
This testbench systematically tests all possible combinations of enable and in for the `decoder_2to4` module and displays the inputs and outputs.

`tb_decoder_4to16.v`
This testbench iterates through all 16 possible in combinations for both enable high and enable low, verifying the correct behavior of the `decoder_4to16` module.
