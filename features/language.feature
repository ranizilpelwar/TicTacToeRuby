Feature: Configuring the game language

	Scenario: The language configuration option is displayed at the start of the game
		Given user is at the start screen
		Then user is displayed an option to configure the language

	Scenario: Display error when default language is not recognized
		Given default language setting is stored as an invalid value
		When user is at the start screen
		Then user is displayed a language configuration error message

  Scenario: User can type the letter L to configure the language
  Given user is at the start screen
  When the user types the letter "L"
  Then the system identifies that the user requested the language to be configured

  Scenario: User can type the letter l to configure the language
  Given user is at the start screen
  When the user types the letter "l"
  Then the system identifies that the user requested the language to be configured

  Scenario: Another key does not trigger the system to configure the language
  Given user is at the start screen
  When the user types the letter "x"
  Then the system properly identifies that the user did not request the language to be configured
