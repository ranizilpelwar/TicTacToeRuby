require_relative '../../TicTacToeRuby.Console/Input/yaml_reader.rb'

RSpec.describe "a YAML Reader" do 

  context "method called generate_file_name" do
    it "raises an ArgumentError when file is nil" do
      expect{ YAMLReader.generate_file_name(nil) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when file is empty" do
      expect{ YAMLReader.generate_file_name("") }.to raise_error(ArgumentError)
    end

    it "includes the directory containing the yaml files in the resulting file name" do
      expect(YAMLReader.generate_file_name("test_file_name").include?("TicTacToeRuby.Console/Languages/")).to be true 
    end

    it "includes the language tag in the resulting file name" do
      expect(YAMLReader.generate_file_name("test_file_name").include?("en")).to be true 
    end

    it "includes the yaml file extension in the resulting file name" do
      expect(YAMLReader.generate_file_name("test_file_name").include?(".yaml")).to be true 
    end
  end

  
end