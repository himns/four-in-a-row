require 'rspec/autorun'
require './lead'
require './user'

describe LeaderBoard do

  let(:leaderboard) {LeaderBoard.new}

  it 'has a position array that stores 500 users' do
    expect(leaderboard.size).to eq(500)
  end

  it 'returns the user at the position specified' do
    expect(leaderboard.position[3].name). to eq("Voile")
    expect(leaderboard.position[3].clan). to eq("Gensokyo")
    expect(leaderboard.position[3].honor). to eq(96)
  end  

end