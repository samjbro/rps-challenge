require 'round'

describe Round do
	subject(:round) { described_class.new(player_1: player_1, player_2: player_2) }
	let(:player_1) { double :player, weapon: weapon_1, take_damage: nil }
	let(:player_2) { double :player, weapon: weapon_2 }
	let(:weapon_1) { double :weapon, score: 0 }
	let(:weapon_2) { double :weapon, score: 1 }
	
	context '#result' do
		it "knows which player has won" do
			expect(round.result[:winner]).to eq player_2
		end
		it "chooses the appropriate verb for the chosen weapons" do
			expect(round.result[:verb]).to eq "covers"
		end
	end

	context '#loser' do
		it "knows which player has lost" do
			expect(round.loser).to eq player_1
		end
	end

	context '#execute' do
		it "reduces loser's hp" do
			expect(player_1).to receive(:take_damage)
			round.execute
		end
	end

end