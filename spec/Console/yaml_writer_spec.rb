require_relative '../../TicTacToeRuby.Console/Output/yaml_writer.rb'

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

    it "raises an ArgumentError when file_path is nil" do
      file_path = nil
      property = "test_property"
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when property is nil" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = nil
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when value is nil" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = nil
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when file_path is empty" do
      file_path = ""
      property = "test_property"
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when property is empty" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = ""
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when value is empty" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = ""
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when file is non-existent" do
      file_path = "spec/TestFiles/testing1.en.yaml"
      property = "test_property"
      value = DateTime.now.to_s
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(ArgumentError)
    end

    it "raises a StandardError when nothing is written to the file" do
      file_path = "spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = ""
      expect{ YAMLWriter.write_data(file_path, property, value) }.to raise_error(StandardError)
    end
  end
end