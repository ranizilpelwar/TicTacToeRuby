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
  end
end