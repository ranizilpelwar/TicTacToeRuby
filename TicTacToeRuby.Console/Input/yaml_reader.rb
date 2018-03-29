require 'yaml'

module YAMLReader

  @localization = "en"

  def self.set_localization(language)
    @localization = language
  end

  def self.generate_file_name(file)
    file_name = "TicTacToeRuby.Console/Languages/" + file + "." + @localization.to_s + ".yaml"
  end

  def self.read_data(file, property)
    file_name = generate_file_name(file)
    file = YAML.load_file(file_name)
    data = file[property]
  end
end
