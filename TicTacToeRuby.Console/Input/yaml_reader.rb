require 'yaml'
require_relative '../Languages/language_setup.rb'

module YAMLReader
  def self.read_data(file_path, property)
    raise ArgumentError, MessageGenerator.argument_error("read_data", "file_path", "nil") if file_path.nil?
    raise ArgumentError, MessageGenerator.argument_error("read_data", "property", "nil") if property.nil?
    raise ArgumentError, MessageGenerator.argument_error("read_data", "file_path", "empty") if file_path == ""
    raise ArgumentError, MessageGenerator.argument_error("read_data", "property", "empty") if property == ""
    raise ArgumentError, MessageGenerator.argument_error("read_data", "file_path", "non-existent") if !(File.exist?(file_path))
    yaml_file = YAML.load_file(file_path)
    data = yaml_file[property]
    raise ArgumentError, MessageGenerator.argument_error("read_data", "file content", "nil") if data.nil?
    yaml_content = data
  end
end
