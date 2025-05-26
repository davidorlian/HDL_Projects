# XOR Gate Using NAND Gates

This project demonstrates the implementation of an XOR (Exclusive OR) gate using only NAND gates, showcasing two different design approaches in Verilog HDL.

## Overview
This implementation proves that XOR functionality can be achieved using only NAND gates, which is significant because NAND gates are functionally complete and can implement any Boolean function.

## Implementation Approaches
### 1. Structural Implementation (XOR.v)
- Uses instantiated NAND gate modules
- Requires 5 NAND gates total
- Demonstrates hierarchical design methodology
- Shows explicit gate-level connections through wire declarations

### 2. Behavioral Implementation (XOR_2.v)
- Uses continuous assignments with NAND logic expressions
- Implements the same 5-NAND gate logic structure
- More compact and readable code
- Functionally equivalent to the structural approach

## Testing
Each implementation includes comprehensive testbenches that:
- Test all possible input combinations (00, 01, 10, 11)
- Display results in a formatted truth table
- Verify correct XOR behavior for both implementations
- Use proper timing delays for signal propagation