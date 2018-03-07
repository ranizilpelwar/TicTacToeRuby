class PlayerManager

  attr_reader :player1, :player2, :currentPlayer

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @currentPlayer = player1
  end

  def updateCurrentPlayer()
    @currentPlayer = getNextPlayer()
  end

  def getNextPlayer()
    nextPlayer = nil
    if (currentPlayer.equals?(player1))
      nextPlayer = player2
    else
      nextPlayer = player1
    end
    return nextPlayer
  end
end