# If the output file has a hash that comes back with malicious greater than 0 it will be output to the screen
file_path = "results.txt"
search_string = "malicious=0"

with open(file_path, "r") as file:
    for line in file:
        if search_string not in line:
            print(line)