class RightCommand
  def self.call
    board  = Simulator.board
    PlaceCommand.call(x: board.x, y: board.y, facing: rotate)
  end

  def self.rotate
    idx = BoardState::CARDINAL_POINTS.index(Simulator.board.facing)

    BoardState::CARDINAL_POINTS.rotate[idx]
  end
end
