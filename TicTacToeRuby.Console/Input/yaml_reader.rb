require 'yaml'
require_relative '../Languages/language_setup.en.rb'

module YAMLReader

  def self.generate_file_path(file_name)
    raise ArgumentError, "YAMLReader cannot generate file name as file is nil." if file_name.nil?
    raise ArgumentError, "YAMLReader cannot generate file name as file is empty." if file_name == ""
    file_path = "TicTacToeRuby.Console/Languages/" + file_name + "." + LanguageSetup.get_localization + ".yaml"
  end

  def self.read_data(file_name, property)
    raise ArgumentError, "YAMLReader cannot read data as file is nil." if file_name.nil?
    raise ArgumentError, "YAMLReader cannot read data as property is nil." if property.nil?
    raise ArgumentError, "YAMLReader cannot read data as file is empty." if file_name == ""
    raise ArgumentError, "YAMLReader cannot read data as property is empty." if property == ""
    file_path = generate_file_path(file_name)
    raise ArgumentError, "YAMLReader cannot read data as file path does not exist." if !(File.exist?(file_path))
    yaml_file = YAML.load_file(file_path)
    data = yaml_file[property]
    raise ArgumentError, "YAMLReader cannot read data. Unable to load yaml content for file name: #{file_name}, property: #{property}." if data.nil?
    yaml_content = data
  end
end
