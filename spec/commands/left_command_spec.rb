RSpec.describe LeftCommand do
  describe '#rotate' do
    it 'rotate from NORTH' do
      allow(Simulator).to receive(:run)
      Simulator.boot!

      PlaceCommand.call(x: "1", y: "1", facing: BoardState::NORTH)
      LeftCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::WEST]
      expect(Simulator.board[1,1]).to eq(expected)
    end

    it 'rotate from WEST' do
      allow(Simulator).to receive(:run)
      Simulator.boot!

      PlaceCommand.call(x: "1", y: "1", facing: BoardState::WEST)
      LeftCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::SOUTH]
      expect(Simulator.board[1,1]).to eq(expected)
    end

    it 'rotate from SOUTH' do
      allow(Simulator).to receive(:run)
      Simulator.boot!

      PlaceCommand.call(x: "1", y: "1", facing: BoardState::SOUTH)
      LeftCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::EAST]
      expect(Simulator.board[1,1]).to eq(expected)
    end

    it 'rotate from EAST' do
      allow(Simulator).to receive(:run)
      Simulator.boot!

      PlaceCommand.call(x: "1", y: "1", facing: BoardState::EAST)
      LeftCommand.call

      expected = BoardState::CARDINAL_MAPPING[BoardState::NORTH]
      expect(Simulator.board[1,1]).to eq(expected)
    end
  end
end
