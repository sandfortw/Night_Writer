describe "test for night_writer" do
  let(:argv) { ['message.txt', 'braille.txt'] }    

  it 'can open a file' do 
    base_file_name = argv[0]
    file0 = File.open("./data/fixtures/#{base_file_name}")
    string = file0.read
    expect(string).to eq("This is the message")
    expect(string.length).to eq(19)
  end
end

