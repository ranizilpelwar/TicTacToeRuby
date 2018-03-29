require 'yaml'
require_relative '../Languages/language_setup.en.rb'

module YAMLReader

  def self.generate_file_name(file)
    file_name = "TicTacToeRuby.Console/Languages/" + file + "." + LanguageSetup.get_localization + ".yaml"
  end

  def self.read_data(file, property)
    file_name = generate_file_name(file)
    file = YAML.load_file(file_name)
    data = file[property]
  end
end
