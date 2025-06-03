# 8-Bit Counter with Loadable Register

This module implements an 8-bit counter that integrates an 8-bit register for programmable loading and reloading functionalities. This design provides a flexible counting mechanism where the initial count value can be set externally and the counter can be reloaded either upon reaching its terminal count or through an external reload signal.

## Module: `cntr_reg_8bit`
This top-level module combines a `register_8bit` and a `cntr_8bit` (reloadable version) to create a more sophisticated counter system.

### Ports
| Name       | Direction | Width  | Description                                                                                                                   |
|------------|-----------|--------|-------------------------------------------------------------------------------------------------------------------------------|
| `clk`      | input     | 1 bit  | System clock                                                                                                                  |
| `rst`      | input     | 1 bit  | Asynchronous reset for the internal register                                                                                  |
| `load`     | input     | 1 bit  | Active-high signal to load `data_in` into the internal register                                                               |
| `re_load`  | input     | 1 bit  | Active-high signal to force a reload of the counter from the stored register value, overriding the terminal count auto-reload |
| `data_in`  | input     | 8 bits | Data to be loaded into the internal register                                                                                  |
| `data_out` | output    | 8 bits | Current count value from the internal counter                                                                                 |
| `tc`       | output    | 1 bit  | Terminal Count flag, asserted when the counter reaches its maximum value                                                      |

### Internal Components
- **register_8bit**: Stores the load value for the counter.
- **cntr_8bit**: The 8-bit counter that can be reset/reloaded.

### Logic
The `re_load` signal and the `tc` (terminal count) signal from the counter are ORed together to generate the reset signal for the internal `cntr_8bit` module. This ensures that the counter reloads either when it reaches its terminal count or when an external `re_load` signal is asserted. The value loaded into the counter comes from the `data_out` of the `register_8bit` module.

## Testbench: `tb_cntr_reg_8bit`
This testbench verifies the functionality of the `cntr_reg_8bit` module.

### Key Features
- **Clock Generation**: Generates a continuous clock signal.
- **Reset Testing**: Tests the asynchronous reset functionality for the register.
- **Load Functionality**: Verifies that `data_in` can be loaded into the internal register.
- **Reload Functionality**: Tests both automatic reload on terminal count and forced reload via `re_load` signal.
- **Data Monitoring**: Monitors all input and output signals, including `data_in` and `data_out` for comprehensive verification.