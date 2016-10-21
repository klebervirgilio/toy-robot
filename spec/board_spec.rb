RSpec.describe BoardState do
  let(:board) { BoardState.new }

  describe '.safe?' do
    context 'when unsafe' do
      it 'returns false' do
        expect(board.safe?(100,100)).to be_falsy
      end
    end
    context 'when safe' do
      it 'returns true' do
        expect(board.safe?(1,1)).to be_truthy
      end
    end
  end

  describe '.translate_cardinal_point' do
    it 'returns a cardinal point symbol' do
      board.place_on_coordinates(x: 1, y: 1, facing: BoardState::NORTH)
      expect(board.translate_cardinal_point).to eq('⬆')
    end
  end

  describe '.place_on_coordinates' do
    it 'places value at coordinates' do
      board.place_on_coordinates(x: 1, y: 1, facing: BoardState::NORTH)
      expect(board[1,1]).to eq(board.translate_cardinal_point)
    end
  end
end
