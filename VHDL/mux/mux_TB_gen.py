def generate_vhdl_mux_loop(mux_degree, num_inputs):
    total_bits = mux_degree + num_inputs  # Total bits (including SEL + inputs)
    total_cases = 2 ** total_bits  # Total test cases

    vhdl_code = []
    vhdl_code.append(f"for i in 0 to {total_cases - 1} loop")
    vhdl_code.append("    -- Assign SEL signals (MSB bits)")

    # SEL assignment (MSBs)
    if mux_degree == 1:
        vhdl_code.append("    if ((i / {divider}) mod 2 = 1) then".format(divider=2 ** num_inputs))
        vhdl_code.append("        tbSEL <= '1';")
        vhdl_code.append("    else")
        vhdl_code.append("        tbSEL <= '0';")
        vhdl_code.append("    end if;")
    else:
        vhdl_code.append("    tbSEL <= std_logic_vector(to_unsigned(i / {divider}, {mux_degree}));".format(divider=2 ** num_inputs, mux_degree = mux_degree))

    vhdl_code.append("\n    -- Assign Input Signals (from highest bit to lowest)")

    # Input assignments (highest bit first)
    for bit_position in reversed(range(num_inputs)):  # Reverse order for highest first
        signal_name = f"tb{chr(65 + (num_inputs - 1 - bit_position))}"  # Generates tbA, tbB, tbC...
        vhdl_code.append(f"    if ((i / {2 ** bit_position}) mod 2 = 1) then")
        vhdl_code.append(f"        {signal_name} <= '1';")
        vhdl_code.append("    else")
        vhdl_code.append(f"        {signal_name} <= '0';")
        vhdl_code.append("    end if;")

    vhdl_code.append("\n    wait for 10 ns;")
    vhdl_code.append("end loop;")

    return "\n".join(vhdl_code)


# Example Usage:
mux_degree = 1  # Number of SEL bits
num_inputs = 2 ** mux_degree  # Number of data input bits

print(generate_vhdl_mux_loop(mux_degree, num_inputs))
