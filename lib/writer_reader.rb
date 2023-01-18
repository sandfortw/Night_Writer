require './lib/latin_to_braille.rb'
require './lib/braille_to_latin'
class NightWriterReader

  def self.encode_file_to_braille
    file0 = File.open("./data/#{ARGV[0]}")
    string = file0.read
    file1 = File.open("./data/#{ARGV[1]}", 'w')
    file1.write(LatinToBraille.translate(string))
    print_string(string)
  end

  def self.decode_file_to_latin 
    file0 = File.open("./data/#{ARGV[0]}")
    string_arr = IO.readlines(file0)
    file1 = File.open("./data/#{ARGV[1]}", 'w')
    string = BrailleToLatin.translate(string_arr)
    file1.write(string)
    print_string(string)
  end

  def self.print_string(string)
    p "Created '#{ARGV[1]}' containing #{string.length} characters"
  end

end