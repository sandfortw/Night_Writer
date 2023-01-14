require './lib/latin_to_braille'
describe LatinToBraille do

  describe '.translate(file)' do
    it 'translates single characters' do
      string = 'h'
      expect(LatinToBraille.translate(string)).to eq('O.\n
                                                      OO\n
                                                      ..')
    end

    it 'translates "hello world"' do
      string = 'hello world'
      expect(LatinToBraille.translate(string)).to eq('0.0.0.0.0....00.0.0.00
                                                      00.00.0..0..00.0000..0
                                                      ....0.0.0....00.0.0...')
    end
  end
 
end