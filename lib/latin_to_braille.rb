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
    string = filter(string)
    paragraph_create(string)
  end

  def self.paragraph_push(row_hash)
    row_hash[:paragraph] << "#{row_hash[:row0].join}\n#{row_hash[:row1].join}\n#{row_hash[:row2].join}"
    row_hash
  end

  def self.row_clear(hash)
    hash[:row0] = []
    hash[:row1] = []
    hash[:row2] = []
    hash
  end

  def self.push_and_clear(row_hash)
    row_clear(paragraph_push(row_hash))
  end

  def self.paragraph_create(string)
    row_hash = { row0: [], row1: [], row2: [], paragraph: []}
    string.chars.each do |char|
      if row_hash[:row0].count % 40 == 0 && row_hash[:row0] != []
        row_hash = push_and_clear(row_hash)
      end
      row_hash = row_push(row_hash, char)
    end
    paragraph_push(row_hash)[:paragraph].join("\n")
  end

  def self.row_push(row_hash, char)
    row_hash[:row0] << @dictionary[char][0]
    row_hash[:row1] << @dictionary[char][1]
    row_hash[:row2] << @dictionary[char][2]
    row_hash
  end

  def self.dictionary
    @dictionary
  end
end
