class LatinToBraille


    @dictionary = {
      'a' => ['O.', '..', '..'],
      'b' => ['O.', 'O.', '..'],
      'c' => ['OO', 'O.', '..'],
      'd' => ['OO', '.O', '..'],
      'e' => ['O.', '.O', '..'],
      'f' => ['OO', 'O.', '..'],
      'g' => ['OO', 'OO', '..'],
      'h' => ['O.', 'OO', '..'],
      'i' => ['.O', 'O.', '..'],
      'j' => ['.O', 'OO', '..'],
      'k' => ['O.', '..', 'O.'],
      'l' => ['O.', 'O.', 'O.'],
      'm' => ['OO', '..', 'O.'],
      'n' => ['OO', '.O', 'O.'],
      'o' => ['O.', '.O', 'O.'],
      'p' => ['OO', 'O.', 'O.'],
      'q' => ['OO', 'OO', 'O.'],
      'r' => ['O.', 'OO', 'O.'],
      's' => ['.O', 'O.', 'O.'],
      't' => ['.O', 'OO', 'O.'],
      'u' => ['O.', '..', 'OO'],
      'v' => ['O.', 'O.', 'OO'],
      'w' => ['.O', 'OO', '.O'],
      'x' => ['OO', '..', 'OO'],
      'y' => ['OO', '.O', 'OO'],
      'z' => ['O.', '.O', 'OO'],
      ' ' => ['..', '..', '..']
    }


  def self.translate(string)
    row0 = []
    row1 = []
    row2 = []
    paragraph = []
    string.chars.each do |char|
      if row0.count % 20 == 0 && row0 != []
        paragraph << "#{row0.join}\n#{row1.join}\n#{row2.join}"
        row0 = []
        row1 = []
        row2 = []
      end
      row0 << @dictionary[char][0]
      row1 << @dictionary[char][1]
      row2 << @dictionary[char][2]
    end
    paragraph << "#{row0.join}\n#{row1.join}\n#{row2.join}"
    paragraph.join("\n\n")
  end


end