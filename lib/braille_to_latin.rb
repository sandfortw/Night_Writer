require './lib/latin_to_braille.rb'
class BrailleToLatin

  @dictionary = {}

  @numdict = {
    'a' => '1',
    'b' => '2',
    'c' => '3',
    'd' => '4',
    'e' => '5',
    'f' => '6',
    'g' => '7',
    'h' => '8',
    'i' => '9',
    'j' => '0'
  }

  LatinToBraille.dictionary.each do |latin, braille|
    @dictionary[braille.join] = latin
  end

  def self.unfilter(string)
    new_string = ""
    string.chars.each_with_index do |char, index|
      transformed = transformed_char(char, index, string) 
      new_string << transformed unless transformed.nil?
    end
    new_string
  end
  
  def self.transformed_char(char, index, string)
    if string[index-1] == '^'
      char.upcase
    elsif string[index-1] == '§'
      @numdict[char]
    else
      char unless char == '§' || char == '^'
    end
  end

  def self.translate(string_arr)
    string_arr2 = string_arr.map{|line| line.chomp}
    row0 = []
    row1 = []
    row2 = []
    string_arr2.each_with_index do |line, index|
      row0 << line if index % 3 == 0
      row1 << line if index % 3 == 1
      row2 << line if index % 3 == 2
    end
    all_chars = [break_row_by_2s(row0),break_row_by_2s(row1),break_row_by_2s(row2)].transpose.map{|char|char.join}
    string = all_chars.map do |char|
      @dictionary[char]
    end.join

    unfilter(string)
  end


  def self.break_row_by_2s(row)
    rowzero = []
    row.join.chars.each_with_index do |char, index|
      if index.odd? 
        rowzero <<"#{char},"
      else
        rowzero<<char
      end
    end
    rowzero.join.split(',')
  end

end