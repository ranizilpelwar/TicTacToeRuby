require 'yaml'
require_relative '../Languages/language_setup.en.rb'

module YAMLReader

  def self.generate_file_name(file)
    raise ArgumentError, "YAMLReader cannot generate file name as file parameter is nil." if file.nil?
    raise ArgumentError, "YAMLReader cannot generate file name as file parameter is empty." if file == ""
    file_name = "TicTacToeRuby.Console/Languages/" + file + "." + LanguageSetup.get_localization + ".yaml"
  end

  def self.read_data(file, property)
    raise ArgumentError, "YAMLReader cannot generate file name as file parameter is nil." if file.nil?
    raise ArgumentError, "YAMLReader cannot generate file name as property parameter is nil." if property.nil?
    raise ArgumentError, "YAMLReader cannot generate file name as file parameter is empty." if file == ""
    raise ArgumentError, "YAMLReader cannot generate file name as property parameter is empty." if property == ""
    file_name = generate_file_name(file)
    file = YAML.load_file(file_name)
    data = file[property]
  end
end
