class BrailleToLatin

  @dictionary = {
    
    "O.OO.." => 'h',
   
  }

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
    all_chars = [row0,row1,row2].transpose.map{|char|char.join}
    all_chars.map do |char|
      @dictionary[char]
    end.join
  end
end