class BrailleToLatin

  @dictionary = {
    
    "O.OO.." => 'h',
   
  }

  def self.translate(string_arr)
    string_arr2 = string_arr.map{|line| line.chomp}
    row0 = []
    row1 = []
    row2 = []
require 'pry'; binding.pry
    string_arr2.each_with_index do |line, index|
      row0 << line if index % 3 == 0
      row1 << line if index % 3 == 1
      row2 << line if index % 3 == 2
    end
    require 'pry'; binding.pry
  end
end