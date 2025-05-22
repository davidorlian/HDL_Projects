import os
import subprocess
import sys

def vhdl_entity_gen(entity):
    output_text = (f'library IEEE;\n    use IEEE.std_logic_1164.all;\n\n'
                   f'entity {entity} is\nport\n(\n\n);\nend {entity};\n\n'
                   f'architecture {entity}_ARC of {entity} is\n\n'
                   f'process\nbegin\n\nend process;\n\n'
                   f'end {entity}_ARC;')
    return output_text

entity_name = input("Enter entity name: ")
entity_upper = entity_name.upper()
vhdl_code = vhdl_entity_gen(entity_upper)

file_name = f"{entity_upper}.vhd"

try:
    with open(file_name, "w") as f:
        f.write(vhdl_code)
    print(f"VHDL entity '{entity_upper}' written to '{file_name}'")

    if sys.platform.startswith('win'):
        notepadpp_path = "C:\\Program Files\\Notepad++\\notepad++.exe"  # Replace with the actual path
        try:
            subprocess.Popen([notepadpp_path, file_name])
        except FileNotFoundError:
            print(f"Notepad++ executable not found at the specified path: {notepadpp_path}")
        except Exception as e:
            print(f"An error occurred while trying to open Notepad++: {e}")
    else:
        print("Opening with Notepad++ is only supported on Windows in this script.")

except Exception as e:
    print(f"An error occurred while writing to the file: {e}")