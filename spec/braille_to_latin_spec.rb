require './lib/braille_to_latin'
describe BrailleToLatin do

  describe '.translate(file)' do
    it 'translates single characters' do
      string = "O.\nOO\n.."
      expect(LatinToBraille.translate(string)).to eq('h')
    end

    it 'translates "hello world"' do
      string = "O.O.O.O.O....OO.O.O.OO\nOO.OO.O..O..OO.OOOO..O\n....O.O.O....OO.O.O..."
      expect(LatinToBraille.translate(string)).to eq('hello world')
    end

  end
 
end