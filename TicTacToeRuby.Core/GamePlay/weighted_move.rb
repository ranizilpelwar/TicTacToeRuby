class WeightedMove
  # index: Spot on board where move is made.
  # score: Value of move made on board.
  attr_accessor :index, :score

  def initialize(index, score)
    @index = index
    @score = score
  end
end