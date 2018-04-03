require_relative '../Input/yaml_reader.rb'

module MessageGenerator

  def self.get_directory
    directory = "TicTacToeRuby.Console/Languages/"
  end

  def self.generate_file_path(file_name, language_tag)
    raise ArgumentError, "MessageGenerator cannot generate file name as file is nil." if file_name.nil?
    raise ArgumentError, "MessageGenerator cannot generate file name as file is empty." if file_name == ""
    file_path = get_directory + file_name + "." + language_tag + ".yaml"
  end

  def self.get_data(file_name, property)
    data = YAMLReader.read_data(generate_file_path(file_name, LanguageSetup.get_localization), property)
  end

  def self.set_localization(language)
      LanguageSetup.set_localization(language)
  end

  def self.welcome
    message = get_data("application_text", "welcome_message")
  end

  def self.language_configuration
    message = get_data("application_text", "language_configuration")
  end

  def self.language_selection_prompt
    message = get_data("application_text", "language_selection_prompt")
  end

  def self.language_options
    options = LanguageSetup.get_languages_hash
    input_choices = LanguageSetup.get_input_choices
    count = input_choices.size
    message = ""
    iterator = 1
    count.times do
      message = message + iterator.to_s + ". " + options[iterator-1]['description'] + "\n"
      iterator = iterator + 1
    end
     message = message + "\n"
  end

  def self.argument_error(method_name, argument_name, reason)
    message = get_data("application_text", "argument_error")
    message = message.sub("[1]", method_name)
    message = message.sub("[2]", argument_name)
    message = message.sub("[3]", reason)
  end
end