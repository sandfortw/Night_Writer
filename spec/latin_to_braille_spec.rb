require './lib/latin_to_braille'
describe LatinToBraille do

  describe '.translate(file)' do
    it 'translates single characters' do
      string = 'h'
      expect(LatinToBraille.translate(string)).to eq("O.\nOO\n..")
    end

    it 'translates "hello world"' do
      string = 'hello world'
      expect(LatinToBraille.translate(string)).to eq("O.O.O.O.O....OO.O.O.OO\nOO.OO.O..O..OO.OOOO..O\n....O.O.O....OO.O.O...")
    end

    it 'can break at 40 chars' do
      string = "the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog"
      expect(LatinToBraille.forty_char_break(string)).to be_a(String)
    end
  end
 
end