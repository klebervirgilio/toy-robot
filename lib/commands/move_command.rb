class MoveCommand
  def self.call
    board = Simulator.board

    case board.facing
    when BoardState::NORTH
      PlaceCommand.call(x: board.x.next, y: board.y, facing: board.facing)
    when BoardState::EAST
      PlaceCommand.call(x: board.x, y: board.y.next, facing: board.facing)
    when BoardState::SOUTH
      PlaceCommand.call(x: board.x.pred, y: board.y, facing: board.facing)
    when BoardState::WEST
      PlaceCommand.call(x: board.x, y: board.y.pred, facing: board.facing)
    end
  end
end
