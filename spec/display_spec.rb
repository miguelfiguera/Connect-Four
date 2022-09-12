require_relative '../display.rb'
require_relative '../players.rb'


describe Display do
    subject(:dis) {described_class.new}
    subject(:player){Players.new('m',1)}
    describe '#changing_array_content' do
        context ' with valid input' do
            it ' changes the index number' do
                num = '1'
                expect(dis.update_display(num,player)).to change(@index_one).by(1)
            end
        end
    end
end