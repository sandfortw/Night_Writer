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

    it 'translates "1Hello World' do
      string = [".OO...O.O.O.O.O......OO.O.O.OO\n", ".O....OO.OO.O..O....OO.OOOO..O\n", "OO...O....O.O.O....O.OO.O.O..."]
      expect(BrailleToLatin.translate(string)).to eq('1Hello World')
    end
  end

  describe '.unfilter(string)' do

    it 'unfilters upcase' do
      string = "^h"
      expect(BrailleToLatin.unfilter(string)).to eq("H")
    end

    it 'unfilters numbers' do
      string = '§a'
      expect(BrailleToLatin.unfilter(string)).to eq("1")
    end
  end
 
end