require 'rspec/autorun'
require '../connect'
require '../player'
require '../grid'

describe Connect do

  let(:game) {Connect.new}

  it 'should switch users after each' do
    expect(game.play_in_turn).to eq("#{active_player.name}, what column do you want to place your disc on?")
  end

  it 'should return which row on the chosen column is available' do
    expect(game.active_player.consecutives).to eq(false)
  end

end

describe Grid do
  let(:matrix) {Grid.new}

  it 'should return a message if there is no more room on that column' do
    expect(matrix.available_row).to eq(false)
  end

  
end


