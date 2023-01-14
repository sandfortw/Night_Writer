base_file_name = ARGV[0]
new_file_name = ARGV[1]

file0 = File.open("./data/#{base_file_name}", "r")
string = file0.read

p "Created '#{new_file_name}' containing #{string.length} characters"
