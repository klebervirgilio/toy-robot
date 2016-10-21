RSpec.describe PlaceCommand do
  describe '#call' do

    before { Simulator.boot! }

    it 'places robot in the given coordinates facing the provided direction' do
      PlaceCommand.call(x: "1", y: "1", facing: BoardState::NORTH)
      expect(Simulator.board[1,1]).not_to eq(BoardState::PLACEHOLDER)
    end
  end
end
