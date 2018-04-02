require 'yaml'
require_relative '../Input/yaml_reader.rb'

module YAMLWriter
  def self.write_data(file_path, property, value)
    yaml_file = YAML.load_file(file_path)
    yaml_file[property] = value
    length_written = File.write(file_path, yaml_file.to_yaml)
    raise StandardError if length_written == 0
  end
end