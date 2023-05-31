# If the output file has a hash that comes back with malicious greater than 0 it will be output to the screen
file_path = "results.txt"
search_string = "malicious=0"
output_file_path = "malicious_results.txt"

with open(file_path, "r") as file:
    with open(output_file_path, "w") as output_file:
        for line in file:
            if search_string not in line:
                output_file.write(line)
                print(line)