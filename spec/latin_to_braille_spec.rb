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
      expect(LatinToBraille.translate(string)).to eq("................................................................................\n................................................................................\n................................................................................")
    end

    it 'can filter characters' do
      string = 'H'
      expect(LatinToBraille.filter(string)).to eq('^h')
      string = 'HI'
      expect(LatinToBraille.filter(string)).to eq('^h^i')

    end

    it 'supports an uppercase letter' do
      string = 'H'
      expect(LatinToBraille.translate(string)).to eq("..O.\n..OO\n.O..")
    end

    it 'translates Hello World' do
      string = 'Hello World'
      expect(LatinToBraille.translate(string)).to eq("..O.O.O.O.O......OO.O.O.OO\n..OO.OO.O..O....OO.OOOO..O\n.O....O.O.O....O.OO.O.O...")
    end
  end
 
end