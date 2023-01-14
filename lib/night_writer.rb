require './lib/latin_to_braille'
base_file_name = ARGV[0]
new_file_name = ARGV[1]

file0 = File.open("./data/#{base_file_name}", "r")
string = file0.read
file1 = File.open("./data/#{new_file_name}", 'w')
file1.write(LatinToBraille.translate(string))
p "Created '#{new_file_name}' containing #{string.length} characters"
