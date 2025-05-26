import os


def print_tree_with_readmes(root):
    """
    Recursively prints the directory tree and the content of README.md files
    inline under each directory where they appear.
    """
    for dirpath, dirnames, filenames in os.walk(root):
        # Tree formatting
        level = dirpath.replace(root, "").count(os.sep)
        indent = "    " * level
        dirname = os.path.basename(dirpath) or "."
        print(f"{indent}{dirname}/")

        # Print files in this directory
        for filename in sorted(filenames):
            file_indent = "    " * (level + 1)
            print(f"{file_indent}{filename}")
            
            if filename == "README.md":
                print("here")
                readme_path = os.path.join(dirpath, filename)
                print("here")
                print(readme_path)
                try:
                    with open(readme_path, encoding='utf-8') as f:
                        content = f.read().strip()
                        print(content)
                        if content:
                            content_lines = content.splitlines()
                            for line in content_lines:
                                print(f"{file_indent}    {line}")
                        else:
                            print(f"{file_indent}    (README.md is empty)")
                except Exception as e:
                    print(f"{file_indent}    (Error reading README.md: {e})")
            

if __name__ == "__main__":
    print("Verilog Directory Tree with README.md Contents:\n")
    print_tree_with_readmes(".")
