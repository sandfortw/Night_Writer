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

    describe 'upcase letters' do
      it 'supports an uppercase letter' do
        string = 'H'
        expect(LatinToBraille.translate(string)).to eq("..O.\n..OO\n.O..")
      end
  
      it 'translates Hello World' do
        string = 'Hello World'
        expect(LatinToBraille.translate(string)).to eq("..O.O.O.O.O......OO.O.O.OO\n..OO.OO.O..O....OO.OOOO..O\n.O....O.O.O....O.OO.O.O...")
      end
    end
   
    describe 'numbers' do
      it 'supports a number' do
        string = '1'
        expect(LatinToBraille.translate(string)).to eq(".OO.\n.O..\nOO..")
      end

      it 'supports all numbers' do
        string = '1234567890'
        expect(LatinToBraille.translate(string)).to eq(".OO..OO..OOO.OOO.OO..OOO.OOO.OO..O.O.O.O\n.O...OO..O...O.O.O.O.OO..OOO.OOO.OO..OOO\nOO..OO..OO..OO..OO..OO..OO..OO..OO..OO..")
      end
    end

    

    it 'translates 1Hello 2World' do
      string = '1Hello World'
      expect(LatinToBraille.translate(string)).to eq(".OO...O.O.O.O.O......OO.O.O.OO\n.O....OO.OO.O..O....OO.OOOO..O\nOO...O....O.O.O....O.OO.O.O...")
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
  end
 

  describe 'adding special char before capital letters' do

    it 'can add upcase character for a letter' do
      string = 'H'
      expect(LatinToBraille.filter(string)).to eq('^h')
    end

    it 'can add upcase character for two letters' do
      string = 'HI'
      expect(LatinToBraille.filter(string)).to eq('^h^i')
    end

    it 'can add upcase character for all letters' do
      string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      expect(LatinToBraille.filter(string)).to eq('^a^b^c^d^e^f^g^h^i^j^k^l^m^n^o^p^q^r^s^t^u^v^w^x^y^z')
    end

  end

  describe 'adding special char before numbers' do
    it 'adds char before single number' do
      string = '1'
      expect(LatinToBraille.numfilter(string)).to eq('§a')
    end

    it 'adds char before 2 numbers' do
      string = '12'
      expect(LatinToBraille.numfilter(string)).to eq('§a§b')
    end

    it 'adds char before all numbers' do
      string = '1234567890'
      expect(LatinToBraille.numfilter(string)).to eq('§a§b§c§d§e§f§g§h§i§j')
    end
  end

end