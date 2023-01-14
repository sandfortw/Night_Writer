require './lib/braille_to_latin'
describe BrailleToLatin do

  describe '.translate(file)' do
    it 'translates single characters' do
      string_arr = ["O.\n", "OO\n", ".."]
      expect(BrailleToLatin.translate(string_arr)).to eq('h')
    end

    it 'translates "hello world"' do
      string = ["O.O.O.O.O....OO.O.O.OO\n","OO.OO.O..O..OO.OOOO..O\n","....O.O.O....OO.O.O..."]
      expect(BrailleToLatin.translate(string)).to eq('hello world')
    end

  end
 
end