require_relative 'yaml_reader.rb'

YAMLReader.set_localization("en")
data = YAMLReader.read_data("application_text", "welcome_message")
puts data