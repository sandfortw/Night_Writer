require './lib/braille_to_latin'

base_file_name = ARGV[0]
new_file_name = ARGV[1]

file0 = File.open("./data/#{base_file_name}")
string_arr = IO.readlines(file0)

file1 = File.open("./data/#{new_file_name}", 'w')

file1.write(BrailleToLatin.translate(string_arr))
p "Created '#{new_file_name}' containing #{BrailleToLatin.translate(string_arr).length} characters"
