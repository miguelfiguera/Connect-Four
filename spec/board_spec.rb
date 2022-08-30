require '../lib/board.rb'

describe Board do 

context '#create_square' do
end

context '#check_owners_dfs' do
end

context '#find_node' do
end

context '#victory?'

context '#valid?'

it 'returns true when position x & Y are between 1 and 7.' do
expect(:position([1,6])).to eql(true)
end

it 'returns false when position x&y are not between 1 and 7' do
expect(:position([1,9])).to eql(false)
end
end
end