Feature: Configuring the game language

	Scenario: The language option is displayed at the start of the game
		Given user is at the start screen
		Then user is displayed an option to configure the language

	Scenario: Display error when default language is not recognized
		Given default language setting is corrupt
		When user is at the start screen
		Then user is displayed an error message indicating the default language setting should be configured manually

	Scenario: Display language choices
		Given default language is English
		When user is on the language configuration screen
		Then user is displayed language choices of English and Spanish

		Given default language is Spanish
		When user is on the language configuration screen
		Then user is displayed language choices of Ingles and Espanol


