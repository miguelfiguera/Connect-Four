require '../lib/squares.rb'

describe Square do 

    describe '#find_node_square' do
    context 'when the node does exist' do
        subject(:square) {described_class.new('Q',[1,2],parents)}
        let(:@@instances) {[square,described_class.new('Q',[1,1],parents=[]),described_class.new('S',[1,3],parents=[])]}

        it 'should return an object'do
        expect(find_node_square([1,2])).to be(square)
    end
        

        it 'the node does not exist, so it returns nil'
        expect(find_node_square([5,6])).to eql(nil)
    end

    describe '#single_retrace_calc' do
        context 'having a node and a value' do
            subject(:node) {described_class.new('Q',[3,4],parents=[])}
            let(:value){[0,-1]}
            it 'returns new position' do
                expect(single_retrace_calc(node,value)).to eql([3,3])

            end
        end
    end


    describe '#check_owners_vertical'

    describe'#check_horizontal_left'

    describe'#check_horizontal_right'

    describe'#check_horizontal_total'

    describe '#check_left_down'

    describe '#check_right_up'

    describe'#check_diagonal_left_to_right'

    describe'#check_right_down'

    describe'#check_left_up'

    describe'#check_diagonal_right_to_left'

    describe'#print_instances'
    
end


