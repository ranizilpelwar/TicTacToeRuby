require 'yaml'
require_relative '../Languages/language_setup.rb'

module YAMLReader
  def self.read_data(file_path, property)
    raise ArgumentError, "YAMLReader cannot read data as file_path is nil." if file_path.nil?
    raise ArgumentError, "YAMLReader cannot read data as property is nil." if property.nil?
    raise ArgumentError, "YAMLReader cannot read data as file_path is empty." if file_path == ""
    raise ArgumentError, "YAMLReader cannot read data as property is empty." if property == ""
    raise ArgumentError, "YAMLReader cannot read data as file path does not exist." if !(File.exist?(file_path))
    yaml_file = YAML.load_file(file_path)
    data = yaml_file[property]
    raise ArgumentError, "YAMLReader cannot read data. Unable to load yaml content for file name: #{file_path}, property: #{property}." if data.nil?
    yaml_content = data
  end
end
