require 'game'

describe Game do
	subject(:game) { described_class.new(player_1: player_1, player_2: player_2) }
	let(:player_1) { double :player, weapon: weapon_1 }
	let(:player_2) { double :player, weapon: weapon_2 }
	let(:weapon_1) { double :weapon, score: 0 }
	let(:weapon_2) { double :weapon, score: 1 }
	context 'players' do
		it "knows player 1" do
			expect(game.player_1).to eq player_1
		end
		it "knows player 2" do
			expect(game.player_2).to eq player_2
		end

	context '#result' do
		it "knows which player has won" do
			expect(game.result[:winner]).to eq player_2
		end
		it "chooses the appropriate verb for the chosen weapons" do
			expect(game.result[:verb]).to eq "covers"
		end
	end

	context '#loser' do
		it "knows which player has lost" do
			expect(game.loser).to eq player_1
		end
	end

	end
end