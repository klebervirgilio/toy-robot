RSpec.describe MoveCommand do

  before { Simulator.boot! }

  describe '#call' do
    it 'moves robot NORTH' do
      PlaceCommand.call(x: "1", y: "1", facing: BoardState::NORTH)
      MoveCommand.call

      expect(Simulator.board[1,1]).to eq(BoardState::PLACEHOLDER)
      expect(Simulator.board[2,1]).not_to eq(BoardState::PLACEHOLDER)
    end
    it 'moves robot SOUTH' do
      PlaceCommand.call(x: "2", y: "1", facing: BoardState::SOUTH)
      MoveCommand.call

      expect(Simulator.board[1,1]).not_to eq(BoardState::PLACEHOLDER)
      expect(Simulator.board[2,1]).to eq(BoardState::PLACEHOLDER)
    end

    it 'moves robot EAST' do
      PlaceCommand.call(x: "1", y: "1", facing: BoardState::EAST)
      MoveCommand.call

      expect(Simulator.board[1,1]).to eq(BoardState::PLACEHOLDER)
      expect(Simulator.board[1,2]).not_to eq(BoardState::PLACEHOLDER)
    end

    it 'moves robot WEST' do
      PlaceCommand.call(x: "1", y: "2", facing: BoardState::WEST)
      MoveCommand.call

      expect(Simulator.board[1,2]).to eq(BoardState::PLACEHOLDER)
      expect(Simulator.board[1,1]).not_to eq(BoardState::PLACEHOLDER)
    end
  end
end
