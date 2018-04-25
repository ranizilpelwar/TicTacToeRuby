require_relative '../../TicTacToeRuby.Core/Languages/yaml_writer.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a yaml writer" do
  context "method called write_data" do
    it "updates the yaml content when a valid file path and property name are provided" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = DateTime.now.to_s
      YAMLWriter.write_data(file_path, property, value)
      yaml_file = YAML.load_file(file_path)
      actual_value = yaml_file[property]
      expect(actual_value).to eq(value)
    end

    it "raises a NilReferenceError when file_path is nil" do
      file_path = nil
      property = "test_property"
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(NilReferenceError)
    end

    it "raises a NilReferenceError when property is nil" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = nil
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(NilReferenceError)
    end

    it "raises a NilReferenceError when value is nil" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = nil
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when file_path is empty" do
      file_path = ""
      property = "test_property"
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when property is empty" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = ""
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when value is empty" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = ""
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when file is non-existent" do
      file_path = "spec/TestFiles/testing1.en.yaml"
      property = "test_property"
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when nothing is written to the file" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = ""
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(InvalidValueError)
    end
  end
end