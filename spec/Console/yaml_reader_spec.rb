require_relative '../../TicTacToeRuby.Console/Input/yaml_reader.rb'

RSpec.describe "a YAML Reader" do 

  context "method called generate_file_path" do
    it "raises an ArgumentError when file is nil" do
      expect{ YAMLReader.generate_file_path(nil) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when file is empty" do
      expect{ YAMLReader.generate_file_path("") }.to raise_error(ArgumentError)
    end

    it "returns a constructed string reprenting a file path" do
      expected_construct = "TicTacToeRuby.Console/Languages/test_file_name.en.yaml"
      expect(YAMLReader.generate_file_path("test_file_name")).to eq(expected_construct)
    end

    it "includes the yaml file directory in the resulting file name" do
      expect(YAMLReader.generate_file_path("test_file_name").include?("TicTacToeRuby.Console/Languages/")).to be true 
    end

    it "includes the language tag in the resulting file name" do
      expect(YAMLReader.generate_file_path("test_file_name").include?("en")).to be true 
    end

    it "includes the yaml file extension in the resulting file name" do
      expect(YAMLReader.generate_file_path("test_file_name").include?(".yaml")).to be true 
    end
  end

  context "method called read_data" do
    it "raises an ArgumentError when file is nil" do
      expect{ YAMLReader.read_data(nil, "welcome") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when file is empty" do
      expect{ YAMLReader.read_data(nil, "welcome") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when property is nil" do
      expect{ YAMLReader.read_data("application_text", nil) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when property is empty" do
      expect{ YAMLReader.read_data("application_text", "") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when an invalid file name is supplied" do
      expect{ YAMLReader.read_data("fake_file_name", "welcome_message") }.to raise_error(ArgumentError)
    end
    
    it "raises an ArgumentError when an invalid property name is supplied" do
      expect{ YAMLReader.read_data("application_text", "fake_property") }.to raise_error(ArgumentError)
    end

    it "returns the text stored in the yaml file when a valid file and property name is supplied" do
      expect(YAMLReader.read_data("application_text", "welcome_message")).to eq("Welcome to Tic Tac Toe! Let's play a game!")
    end
  end
end