RSpec.describe RightCommand do
  describe '#rotate' do
    before { Simulator.boot! }

    it 'rotate from NORTH' do
      PlaceCommand.call(x: "1", y: "1", facing: BoardState::NORTH)
      RightCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::EAST]
      expect(Simulator.board[1,1]).to eq(expected)
    end

    it 'rotate from EAST' do
      PlaceCommand.call(x: "1", y: "1", facing: BoardState::EAST)
      RightCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::SOUTH]
      expect(Simulator.board[1,1]).to eq(expected)
    end

    it 'rotate from SOUTH' do
      PlaceCommand.call(x: "1", y: "1", facing: BoardState::SOUTH)
      RightCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::WEST]
      expect(Simulator.board[1,1]).to eq(expected)
    end

    it 'rotate from WEST' do
      PlaceCommand.call(x: "1", y: "1", facing: BoardState::WEST)
      RightCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::NORTH]
      expect(Simulator.board[1,1]).to eq(expected)
    end
  end
end
