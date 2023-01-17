require './lib/latin_to_braille'
describe LatinToBraille do

  describe '.translate(file)' do

    describe 'single lowercase characters and spaces' do
      it 'translates a space' do
        string = ' '
        expect(LatinToBraille.translate(string)).to eq("..\n..\n..")
      end
      it 'translates "h"' do
        string = 'h'
        expect(LatinToBraille.translate(string)).to eq("O.\nOO\n..")
      end

      it 'translates "a' do
        string = 'a'
        expect(LatinToBraille.translate(string)).to eq("O.\n..\n..")
      end
    end

    describe 'multiple lowercase characters' do
      it 'translates "ab"' do
        string = 'ab'
        expect(LatinToBraille.translate(string)).to eq("O.O.\n..O.\n....")
      end

      it 'translates "hello world"' do
        string = 'hello world'
        expect(LatinToBraille.translate(string)).to eq("O.O.O.O.O....OO.O.O.OO\nOO.OO.O..O..OO.OOOO..O\n....O.O.O....OO.O.O...")
      end
    end

    describe '80 positions wide' do
      it 'can break at 41 chars (spaces)' do
        string = "                                         "
        expect(LatinToBraille.translate(string)).to eq("................................................................................\n................................................................................\n................................................................................\n..\n..\n..")
      end

      it 'can break at 41 chars(letter "a")' do
        string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        expect(LatinToBraille.translate(string)).to eq("O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.\n................................................................................\n................................................................................\nO.\n..\n..")
      end
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

    it 'can filter numbers' do
      string = '1'
      expect(LatinToBraille.numfilter(string)).to eq('§a')
    end

    it 'translates 1Hello 2World' do
      string = '1Hello World'
      expect(LatinToBraille.translate(string)).to eq(".OO...O.O.O.O.O......OO.O.O.OO\n.O....OO.OO.O..O....OO.OOOO..O\nOO...O....O.O.O....O.OO.O.O...")
    end
  end
 
end