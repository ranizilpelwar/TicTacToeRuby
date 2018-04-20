class PlayerSymbolSetup

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
  end

  def display_screen_title
    @writer.display_message(MessageGenerator.title_of_player_setup_screen)
  end

  def display_options
    # display formatted list of options using Message Generator
  end

  def input_choices
    # alpha characters
    # symbols
    # return an array of strings
  end

  def valid_selection?(selected_input)
    # match against regex pattern
    # should be in business logic layer - use this method as a wrapper
  end

  def display_invalid_input_message

  end
end
