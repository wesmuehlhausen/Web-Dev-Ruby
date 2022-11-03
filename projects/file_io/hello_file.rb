fname = "sample.txt" # Create a text file. Create a new one if one exists
file = File.open(fname, "a") # Open the file in write mode
    # Using "w" mode on an existing file will erase the contents of that file.
    # If you want to append to an existing file, use "a" as the second argument
line = gets
file.puts line # Put a line in the file (File has its own method for this. it isnt the same as our puts)
file.close # close the file

