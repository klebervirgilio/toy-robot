RSpec.describe Simulator do
  describe '#boot!' do
    it 'initialize the board' do
      Simulator.boot!
      expect(Simulator.board).to be_an_instance_of(BoardState)
    end
  end
end
