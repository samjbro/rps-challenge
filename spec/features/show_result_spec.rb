feature 'Show results' do
	
	before do
		sign_in_and_play_1_player_rps
		allow(Kernel).to receive(:rand).and_return(1)
	end

	scenario "Shows the player's choice" do
		choose "Rock"
		click_button "Submit"
		expect(page).to have_content "Sam chose Rock!"
	end

	scenario "Shows the computerised opponent's choice" do
		choose "Rock"
		click_button "Submit"
		expect(page).to have_content "Computer chose Paper!"
	end

	scenario "States that the player has won" do
		choose "Scissors"
		click_button "Submit"
		expect(page).to have_content "Scissors cut Paper! Sam wins!"
	end
	scenario "States that the computer opponent has won" do
		choose "Rock"
		click_button "Submit"
		expect(page).to have_content "Paper covers Rock! Computer wins!"
	end
	scenario "States that the game is a tie" do
		choose "Paper"
		click_button "Submit"
		expect(page).to have_content "The game is a tie!"
	end
	scenario "Uses verb appropriate to combination" do
		choose "Spock"
		click_button "Submit"
		expect(page).to have_content "disproves"
	end
end

feature "Shows reduced hit points" do
	before do
		sign_in_and_play_1_player_rps
		allow(Kernel).to receive(:rand).and_return(1)
	end
	scenario "for player 1 if loser" do
		choose "Spock"
		click_button "Submit"
		expect(page).to have_content "Sam's HP: 99/100"
		expect(page).to have_content "Computer's HP: 100/100"
	end
	scenario "for player 2 if loser" do
		choose "Scissors"
		click_button "Submit"
		expect(page).to have_content "Sam's HP: 100/100"
		expect(page).to have_content "Computer's HP: 99/100"
	end
	scenario "for neither player if tie" do
		choose "Paper"
		click_button "Submit"
		expect(page).to have_content "Sam's HP: 100/100"
		expect(page).to have_content "Computer's HP: 100/100"
	end

end
feature "Game Over" do
	scenario "when a player's hit points are 0" do
		sign_in_and_play_2_player_rps
		allow(Kernel).to receive(:rand).and_return(100)
		within('.first') do
			choose 'Scissors', 'chosen_weapon_1'
		end
		within('.second') do
			choose 'Paper', 'chosen_weapon_2'
		end
		click_button "Submit"
		expect(page).to have_content "Sam has won the game!"
	end
end
















