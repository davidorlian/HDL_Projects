# 8-Bit Counter Module and Testbench

This module demonstrates a simple 8-bit synchronous counter, along with a testbench designed to verify its functionality.

Typically, counters encapsulate their internal state, which can make simulation and debugging more difficult. In this testbench, hierarchical signal access is used to "peek" inside the Design Under Test (DUT) and observe the counter's internal state directly during simulation. This allows verification of the counter’s behavior without modifying its implementation.

## Key Features
- 8-bit synchronous counter (counts from 0 to 255)
- Synchronous reset
- Terminal count (`tc`) output asserted when the counter reaches its maximum value (255)
- Testbench uses hierarchical signal access to monitor internal signal (`DUT.q`)
- Uses `force` and `release` to control internal state for test purposes

## Verification Approach
The testbench uses several techniques to validate the counter's behavior:
- **Hierarchical Signal Access**: Allows observation of internal signal `DUT.q` directly in the simulation, enabling tracking of the counter value without modifying the design.
- **Forcing Values**: The `force` construct is used to set the internal counter value to a specific value (`8'hEF`) during simulation. This is especially useful in verifying edge conditions, such as behavior near the terminal count.
- **Reset Testing**: The testbench applies multiple reset pulses at different times, verifying the synchronous reset behavior under various timing conditions.
