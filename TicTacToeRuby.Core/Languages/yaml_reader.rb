require 'yaml'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

module YAMLReader
  def self.read_data(file_path, property)
    raise NilReferenceError, "file_path" if file_path.nil?
    raise InvalidValueError, "file_path" if file_path == ""
    file_path = File.dirname(__FILE__) + '/' + file_path
    raise InvalidValueError, "file_path = #{file_path}" if !(File.exist?(file_path))
    raise NilReferenceError, "property" if property.nil?
    raise InvalidValueError, "property" if property == ""
    yaml_file = YAML.load_file(file_path)
    data = yaml_file[property]
    raise InvalidValueError, property.to_s if data.nil?
    yaml_content = data
  end
end
