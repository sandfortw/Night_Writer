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
      string = "                                        "
      expect(LatinToBraille.translate(string)).to eq("........................................\n........................................\n........................................\n\n........................................\n........................................\n........................................\n")
    end
  end
 
end