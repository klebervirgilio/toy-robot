class LeftCommand
  def self.call
    board = Simulator.board
    PlaceCommand.call(x: board.x, y: board.y, facing: rotate)
  end

  def self.rotate
    idx = BoardState::CARDINAL_POINTS.index(Simulator.board.facing)

    BoardState::CARDINAL_POINTS.rotate(-1)[idx]
  end
end
