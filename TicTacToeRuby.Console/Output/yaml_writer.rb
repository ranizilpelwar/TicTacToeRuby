require 'yaml'
require_relative '../Input/yaml_reader.rb'

module YAMLWriter
  def self.write_data(file_path, property, value)
    raise ArgumentError, MessageGenerator.argument_error("write_data", "file_path", "nil") if file_path.nil?
    raise ArgumentError, MessageGenerator.argument_error("write_data", "property", "nil") if property.nil?
    raise ArgumentError, MessageGenerator.argument_error("write_data", "value", "nil") if value.nil?
    raise ArgumentError, MessageGenerator.argument_error("write_data", "file_path", "empty") if file_path == ""
    raise ArgumentError, MessageGenerator.argument_error("write_data", "property", "empty") if property == ""
    raise ArgumentError, MessageGenerator.argument_error("write_data", "value", "empty") if value == ""
    raise ArgumentError, MessageGenerator.argument_error("write_data", "file", "non-existent") if !(File.exist?(file_path))
    yaml_file = YAML.load_file(file_path)
    yaml_file[property] = value
    length_written = File.write(file_path, yaml_file.to_yaml)
    raise StandardError if length_written == 0
  end
end