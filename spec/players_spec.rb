require_relative '../players.rb'

describe Players do
    describe '#valid_player_input?' do
        before do
            subject(:player) {Players.new('M',1)}
            allow(valid_player_input?).to receive(String)
        end

        context ' with valid input' do
            it 'returns true' do
            expect(player.valid_player_input?('1')).to eq(true)
            end
        end

        context 'invalid input' do
            xit 'returns false' do
                expect(player.valid_player_input?('Q')).to be(false)
            end
        end
    end

end