require_relative '../../TicTacToeRuby.Core/Languages/yaml_reader.rb'
require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a YAML Reader" do 

  context "method called generate_file_path" do
    it "raises a NilReferenceError when file is nil" do
      expect{ MessageGenerator.generate_file_path(nil, "en") }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when file is empty" do
      expect{ MessageGenerator.generate_file_path("", "en") }.to raise_error(InvalidValueError)
    end

    it "returns a constructed string reprenting a file path" do
      expected_construct = MessageGenerator.directory + "test_file_name.en.yaml"
      expect(MessageGenerator.generate_file_path("test_file_name", "en")).to eq(expected_construct)
    end

    it "includes the yaml file directory in the resulting file name" do
      expect(MessageGenerator.generate_file_path("test_file_name", "en").include?(MessageGenerator.directory)).to be true 
    end

    it "includes the language tag in the resulting file name" do
      expect(MessageGenerator.generate_file_path("test_file_name", "en").include?("en")).to be true 
    end

    it "includes the yaml file extension in the resulting file name" do
      expect(MessageGenerator.generate_file_path("test_file_name", "en").include?(".yaml")).to be true 
    end
  end

  context "method called read_data" do
    it "raises a NilReferenceError when file is nil" do
      expect{ YAMLReader.read_data(nil, "welcome") }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when file is empty" do
      expect{ YAMLReader.read_data("", "welcome") }.to raise_error(InvalidValueError)
    end

    it "raises an NilReferenceError when property is nil" do
      file_path = "../../spec/TestFiles/testing.en.yaml"
      expect{ YAMLReader.read_data(file_path, nil) }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when property is empty" do
      file_path = "../../spec/TestFiles/testing.en.yaml"
      expect{ YAMLReader.read_data(file_path, "") }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when an invalid file name is supplied" do
      file_path = "Files/testing.en.yaml"
      expect{ YAMLReader.read_data(file_path, "welcome_message") }.to raise_error(InvalidValueError)
    end
    
    it "raises an InvalidValueError when an invalid property name is supplied" do
      file_path = "../../spec/TestFiles/testing.en.yaml"
      expect{ YAMLReader.read_data(file_path, "fake_property") }.to raise_error(InvalidValueError)
    end

    it "returns the text stored in the yaml file when a valid file and property name is supplied" do
      file_path = "../../spec/TestFiles/testing.en.yaml"
      expect(YAMLReader.read_data(file_path, "test_readonly_property")).to eq("Welcome message for game!")
    end
  end
end