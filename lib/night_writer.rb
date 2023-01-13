base_file_name = ARGV[0]
new_file_name = ARGV[1]

file0 = File.open("./data/#{base_file_name}", "r")
require 'pry'; binding.pry
p "Created '#{new_file}' containing 11 characters"
