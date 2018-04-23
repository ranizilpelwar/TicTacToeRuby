class LanguageOptionsSetup

  def initialize(reader, writer, language_adapter)
    @reader = reader
    @writer = writer
    @language_adapter = language_adapter
  end

  def display_screen_title
    @writer.display_message(MessageGenerator.title_of_language_options_screen)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def display_options
    @writer.display_message(MessageGenerator.language_options)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def user_selection
    input = @reader.read_and_validate(InputValidator.valid?, @language_adapter.input_choices, @writer, MessageGenerator.invalid_selection_error)
    language_tag = @language_adapter.language_tag_for_input_choice(input)
  end

  def save_changes!(language_tag)
    @language_adapter.default_language_tag!(language_tag)
  end

  def display_and_configure!
    display_screen_title
    display_options
    save_changes!(user_selection)
  end
end
