require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'

RSpec.describe "a message generator" do
  context "method called argument_error" do
    it "returns the expected message based on valid inputs" do
      method_name = "test_method"
      argument_name = "test_argument_name"
      reason = "test_reason"
      actual = MessageGenerator.argument_error(method_name, argument_name, reason)
      expected = "Cannot test_method because test_argument_name is test_reason."
      expect(actual).to eq(expected)
    end
  end
end