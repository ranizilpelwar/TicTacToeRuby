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

  def display_prompt
    @writer.display_message(MessageGenerator.language_selection_prompt)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def display_options
    language_options = MessageGenerator.language_options
    language_options.each do |option|
      @writer.display_message(option)
    end
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def user_selection
    input = @reader.read_and_validate(InputValidator.valid?, @language_adapter.input_choices, @writer, error_message)
    language_tag = @language_adapter.language_tag_for_input_choice(input)
  end

  def update_language!(language_tag)
    @language_adapter.default_language_tag!(language_tag)
  end

  def display_and_configure!
    display_screen_title
    display_prompt
    display_options
    update_language!(user_selection)
  end

  def error_message
    error_message = MessageGenerator.invalid_selection_error
    error_message = error_message + MessageGenerator.line_spacer
    error_message = error_message + MessageGenerator.language_selection_prompt 
    error_message = error_message + MessageGenerator.line_spacer
  end
end
