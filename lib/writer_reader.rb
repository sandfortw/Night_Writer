require './lib/latin_to_braille.rb'
require './lib/braille_to_latin'
class NightWriterReader

  def self.encode_file_to_braille
    base_file_name = ARGV[0]
    new_file_name = ARGV[1]
    file0 = File.open("./data/#{base_file_name}")
    string = file0.read
    file1 = File.open("./data/#{new_file_name}", 'w')
    file1.write(LatinToBraille.translate(string))
    print_string(string)
  end

  def self.decode_file_to_latin 
    base_file_name = ARGV[0]
    new_file_name = ARGV[1]
    file0 = File.open("./data/#{base_file_name}")
    string_arr = IO.readlines(file0)
    file1 = File.open("./data/#{new_file_name}", 'w')
    string = BrailleToLatin.translate(string_arr)
    require 'pry'; binding.pry
    file1.write(string)
    print_string(string)
  end

  def self.print_string(string)
    p "Created '#{ARGV[1]}' containing #{string.length} characters"
  end

end