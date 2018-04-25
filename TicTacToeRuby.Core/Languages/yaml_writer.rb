require 'yaml'
require_relative './yaml_reader.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

module YAMLWriter
  def self.write_data(file_path, property, value)
    raise NilReferenceError, "file_path" if file_path.nil?
    raise NilReferenceError, "property" if property.nil?
    raise NilReferenceError, "value" if value.nil?
    raise InvalidValueError, "file_path" if file_path == ""
    raise InvalidValueError, "property" if property == ""
    raise InvalidValueError, "value" if value == ""
    raise InvalidValueError, "file" if !(File.exist?(file_path))
    yaml_file = YAML.load_file(file_path)
    yaml_file[property] = value
    length_written = File.write(file_path, yaml_file.to_yaml)
    raise InvalidValueError if length_written == 0
  end
end