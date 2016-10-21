class PlaceCommand
  def self.call(x:, y:, facing: )
    Simulator.board.place_on_coordinates(
      x: x.to_i, y: y.to_i, facing: facing
    )
  end
end
