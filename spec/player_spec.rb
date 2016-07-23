require 'player'

describe Player do
	subject(:player) { described_class.new(name: "Sam") }
	let(:weapon) { :weapon }

	it "knows its name" do
		expect(player.get_name).to eq "Sam"
	end

	it "is called 'Computer' if no name is supplied" do
		expect(Player.new.get_name).to eq "Computer"
	end

	context '#choose_weapon' do

		it "can choose a weapon" do
			player.choose_weapon(weapon: weapon)
			expect(player.get_weapon).to eq weapon
		end
		it "chooses a random weapon if none supplied" do
			player.choose_weapon
			allow(Kernel).to receive(:rand).and_return(0)
			expect(player.get_weapon).to eq "Rock"
		end
	end
end