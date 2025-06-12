import os
import difflib
from collections import defaultdict

default_html_name = "diff.html"
default_base_dir = "."
expected_output_file_ending = ".exp.processed"
actual_output_file_ending = ".out.processed"
unique_expected_file_identifier = "exp"
unique_output_file_identifier = "out"

def list_files_in_directory(directory_path):
    file_names = []
    for entry in os.listdir(directory_path):
        full_path = os.path.join(directory_path, entry)
        if os.path.isfile(full_path):
            file_names.append(entry)
    return file_names

def generate_html_diff(path_of_original_file, path_of_new_file, output_path=default_html_name, base_dir=default_base_dir):
    file1_path = path_of_original_file
    file2_path = path_of_new_file
    original_no_base_dir_file1 = path_of_original_file
    original_no_base_dir_file2 = path_of_new_file
    file1_path = os.path.join(base_dir, file1_path)
    file2_path = os.path.join(base_dir, file2_path)
    
    with open(file1_path) as f1, open(file2_path) as f2:
        f1_lines = f1.readlines()
        f2_lines = f2.readlines()

    html_diff = difflib.HtmlDiff().make_table(
        f1_lines, f2_lines,
        fromdesc=os.path.basename(file1_path),
        todesc=os.path.basename(file2_path),
        context=True,
        numlines=5
    )

    section = f"""
    <h2>Diff of {original_no_base_dir_file1} and {original_no_base_dir_file2}</h2>
    {html_diff}
    <hr>
    """

    if not os.path.exists(output_path):
        with open(output_path, 'w') as f:
            f.write("<html><head><meta charset='UTF-8'><title>File Diffs</title></head><body>\n")

    with open(output_path, 'a') as output_file:
        output_file.write(section)


# Optional: close the HTML if you're done appending
def finalize_diff_html(output_path=default_html_name):
    with open(output_path, 'a') as f:
        f.write("</body></html>\n")


def group_processed_files(file_list):
    groups = defaultdict(dict)
    
    for filename in file_list:
        if filename.endswith(expected_output_file_ending):
            base = filename[:-len(expected_output_file_ending)]
            groups[base][unique_expected_file_identifier] = filename
        elif filename.endswith(actual_output_file_ending):
            base = filename[:-len(actual_output_file_ending)]
            groups[base][unique_output_file_identifier] = filename

    # Create pairs only where both versions exist
    pairs = [
        (group[unique_expected_file_identifier], group[unique_output_file_identifier])
        for group in groups.values()
        if unique_expected_file_identifier in group and unique_output_file_identifier in group
    ]

    return pairs



def main():
    directory_path = '' # Replace with your directory path, if not done then the user would be prompted to input path

    ask_for_path = not directory_path

    if ask_for_path:
        directory_path = input("input path to *.returned: ")


    out_html = directory_path + r'/' + default_html_name

    with open(out_html, 'w') as f: #make the header render the colors
        f.write("""<html>
<head>
<meta charset='UTF-8'>
<title>File Diffs</title>
<style>
    table.diff {font-family: Courier; border: medium;}
    .diff_header {background-color:#e0e0e0}
    td.diff_header {text-align:right}
    .diff_next {background-color:#c0c0c0}
    .diff_add {background-color:#aaffaa}  /* Bright green */
    .diff_chg {background-color:#ffff77}  /* Bright yellow */
    .diff_sub {background-color:#ff9999}  /* Bright red */
</style>
</head>
<body>
""")

    files = list_files_in_directory(directory_path)
    pairs = group_processed_files(files)

    for output, expected in pairs:
        generate_html_diff(expected,output,output_path=out_html,base_dir=directory_path)

    finalize_diff_html(output_path=out_html)
    #generate_html_diff('file1.txt', 'file2.txt')

    test_names = []
    [test_names.append(name.split('.')[0]) for name in files if name.split('.')[0] not in test_names]

    [print(testname) for testname in test_names]
    #print(f'total tests compared: {test_names}')



if __name__ == "__main__":
    main()
