from pathlib import Path


def extract_text_from_file(file_path):
    """Extract text content from a code or markdown file."""
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            return file.read()
    except UnicodeDecodeError:
        # Try with different encoding if UTF-8 fails
        try:
            with open(file_path, 'r', encoding='latin-1') as file:
                return file.read()
        except Exception as e:
            return f"[Error reading file with latin-1 encoding: {str(e)}]"
    except Exception as e:
        return f"[Error reading file: {str(e)}]"


def get_file_type_symbol(file_extension):
    """Return a symbol to represent the file type."""
    symbols = {
        '.py': '🐍 PYTHON',
        '.v': '⚡ VERILOG',
        '.md': '📝 MARKDOWN'
    }
    return symbols.get(file_extension, f'📄 {file_extension.upper()}')


def process_code_files(input_folder, output_file):
    """Process all .v, .py, and .md files in the input folder and subfolders."""
    input_path = Path(input_folder)

    if not input_path.exists():
        print(f"Error: Input folder '{input_folder}' does not exist.")
        return False

    if not input_path.is_dir():
        print(f"Error: '{input_folder}' is not a directory.")
        return False

    # Find all target files recursively
    target_extensions = ['.v', '.py', '.md']
    all_files = []

    for ext in target_extensions:
        # Use rglob for recursive search (includes subfolders)
        files = list(input_path.rglob(f'*{ext}'))
        all_files.extend(files)

    if not all_files:
        print(f"No .v, .py, or .md files found in '{input_folder}' and its subfolders")
        return False

    # Sort files by their relative path for organized output
    all_files.sort(key=lambda x: str(x.relative_to(input_path)))

    print(f"Found {len(all_files)} file(s) to process...")

    # Group files by directory for better organization
    files_by_dir = {}
    for file_path in all_files:
        relative_path = file_path.relative_to(input_path)
        dir_path = relative_path.parent

        if dir_path not in files_by_dir:
            files_by_dir[dir_path] = []
        files_by_dir[dir_path].append(file_path)

    # Process files and write to output
    try:
        with open(output_file, 'w', encoding='utf-8') as outfile:
            outfile.write(f"CODE AND DOCUMENTATION EXTRACTION\n")
            outfile.write(f"Source Folder: {input_path}\n")
            outfile.write(f"Total Files: {len(all_files)}\n")
            outfile.write(f"Generated: {Path.cwd()}\n")
            outfile.write(f"{'=' * 80}\n\n")

            # Process files organized by directory
            for dir_path in sorted(files_by_dir.keys()):
                # Write directory header
                if str(dir_path) == '.':
                    dir_name = "ROOT DIRECTORY"
                else:
                    dir_name = f"DIRECTORY: {dir_path}"

                outfile.write(f"\n{'#' * 60}\n")
                outfile.write(f"📁 {dir_name}\n")
                outfile.write(f"{'#' * 60}\n\n")

                # Process files in this directory
                files_in_dir = sorted(files_by_dir[dir_path], key=lambda x: x.name)
                for i, file_path in enumerate(files_in_dir, 1):
                    relative_path = file_path.relative_to(input_path)
                    print(f"Processing: {relative_path}")

                    # Write file header
                    file_symbol = get_file_type_symbol(file_path.suffix)
                    outfile.write(f"\n{'─' * 50}\n")
                    outfile.write(f"{file_symbol} FILE: {file_path.name}\n")
                    outfile.write(f"📍 PATH: {relative_path}\n")
                    outfile.write(f"📊 SIZE: {file_path.stat().st_size} bytes\n")
                    outfile.write(f"{'─' * 50}\n\n")

                    # Extract and write content
                    content = extract_text_from_file(file_path)
                    if content.strip():  # Only write if there's actual content
                        outfile.write(content)
                        if not content.endswith('\n'):
                            outfile.write('\n')
                    else:
                        outfile.write("[Empty file or no readable content]\n")

                    outfile.write(f"\n{'─' * 50}\n")
                    outfile.write(f"END OF {file_path.name}\n")
                    outfile.write(f"{'─' * 50}\n\n")

        print(f"\nContent successfully extracted to: {output_file}")
        print(f"Total files processed: {len(all_files)}")

        # Print summary by file type
        type_counts = {}
        for file_path in all_files:
            ext = file_path.suffix
            type_counts[ext] = type_counts.get(ext, 0) + 1

        print("\nFile type summary:")
        for ext, count in sorted(type_counts.items()):
            file_type = get_file_type_symbol(ext)
            print(f"  {file_type}: {count} files")

        return True

    except Exception as e:
        print(f"Error writing to output file: {str(e)}")
        return False


if __name__ == "__main__":
    # Interactive mode
    input_folder = input("Enter the path to the folder with code files (.v, .py, .md): ").strip()
    output_file = input("Enter output file name (or press Enter for 'extracted_code.txt'): ").strip()
    if not output_file:
        output_file = "extracted_code.txt"

    success = process_code_files(input_folder, output_file)

    if success:
        print("\nExtraction completed successfully!")
    else:
        print("\nExtraction failed!")