class WeightedMove
  # index: Spot on board where move is made.
  # score: Value of move made on board.
  attr_accessor :index, :score

  def initialize(index, score)
    raise ArgumentError, MessageGenerator.argument_error("initialize", "index", "nil") if index.nil?
    raise ArgumentError, MessageGenerator.argument_error("initialize", "score", "nil") if score.nil?
    @index = index
    @score = score
  end
end