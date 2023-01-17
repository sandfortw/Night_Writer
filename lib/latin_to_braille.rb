class LatinToBraille
  @dictionary = {
    'a' => ['O.', '..', '..'],
    'b' => ['O.', 'O.', '..'],
    'c' => ['OO', '..', '..'],
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
    ' ' => ['..', '..', '..'],
    '^' => ['..', '..', '.O'],
    '§' => ['.O', '.O', 'OO']
  }

  @numdict = {
    '1' => @dictionary.keys[0],
    '2' => @dictionary.keys[1],
    '3' => @dictionary.keys[2],
    '4' => @dictionary.keys[3],
    '5' => @dictionary.keys[4],
    '6' => @dictionary.keys[5],
    '7' => @dictionary.keys[6],
    '8' => @dictionary.keys[7],
    '9' => @dictionary.keys[8],
    '0' => @dictionary.keys[9]
  }

  def self.numfilter(string)
    new_string = []
    string.each_char do |c|
      if /[1234567890]/.match?(c)
        new_string << '§'
        new_string << @numdict[c]
      else
        new_string << c
      end
    end
    new_string.join
  end

  def self.capfilter(string)
    new_string = []
    string.each_char do |c|
      new_string << '^' if /[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/.match?(c)
      new_string << c.downcase
    end
    new_string.join
  end

  def self.filter(string)
    capfilter(numfilter(string))
  end

  def self.translate(string)
    paragraph_create(filter(string)).join("\n")
  end

  def self.paragraph_push_and_rowclear(row_hash)
    row_hash[:paragraph] << "#{row_hash[:row0].join}\n#{row_hash[:row1].join}\n#{row_hash[:row2].join}"
    row_hash[:row0] = row_hash[:row1] = row_hash[:row2] = []
    row_hash
  end

  def self.paragraph_create(string)
    row_hash = { row0: [], row1: [], row2: [], row3: [], paragraph: [] }
    string.chars.each do |char|
      row_hash = paragraph_push_and_rowclear(row_hash) if row_hash[:row0].count % 40 == 0 && row_hash[:row0] != []
      row_push(row_hash, char)
    end
    paragraph_push_and_rowclear(row_hash)[:paragraph]
  end

  def self.row_push(row_hash, char)
    row_hash[:row0] << @dictionary[char][0]
    row_hash[:row1] << @dictionary[char][1]
    row_hash[:row2] << @dictionary[char][2]
  end

  def self.dictionary
    @dictionary
  end
end
