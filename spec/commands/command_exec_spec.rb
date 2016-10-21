RSpec.describe CommandExec do
  describe '#perform' do

    before { Simulator.boot! }

    context 'when place command have not been called yet' do
      it 'does not handle commands' do
        expect(CommandExec).not_to receive(:handle_move)
        CommandExec.perform('MOVE')
      end
    end

    context 'when place command have already been called' do
      it 'does not handle commands' do
        expect(CommandExec).to receive(:handle_move)
        CommandExec.perform('P,1,1,N')
        CommandExec.perform('MOVE')
      end
    end
  end
end

def be_handled
  throw_symbol(:handled)
end
