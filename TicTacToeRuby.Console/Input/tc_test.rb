require_relative 'yaml_reader.rb'

data = YAMLReader.read_data("../Languages/application_text.en.yaml", "welcome_message")
puts data