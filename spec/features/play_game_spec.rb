feature 'When playing Rock, Paper, Scissors,' do
	scenario 'All 5 options are visible for player 1' do
		sign_in_and_play_1_player_rps
		expect(page).to have_content "Rock"
		expect(page).to have_content "Paper"
		expect(page).to have_content "Scissors"
		expect(page).to have_content "Lizard"
		expect(page).to have_content "Spock"
	end

	scenario 'All 5 options are visible for player 2' do
		sign_in_and_play_2_player_rps
		expect(page).to have_content "Rock"
		expect(page).to have_content "Paper"
		expect(page).to have_content "Scissors"
		expect(page).to have_content "Lizard"
		expect(page).to have_content "Spock"
	end

	scenario 'Player 1 is able to select an option' do
		sign_in_and_play_1_player_rps
		choose 'Rock'
	end
	scenario 'Player 2 is able to select an option' do
		sign_in_and_play_2_player_rps
		within('.first') do
			choose 'Scissors', 'chosen_weapon_2'
		end
		within('.second') do
			choose 'Scissors', 'chosen_weapon_2'
		end
	end

	scenario "players' hit points are displayed" do
		sign_in_and_play_1_player_rps
		expect(page).to have_content "Sam's HP: 100/100"
		expect(page).to have_content "Computer's HP: 100/100"
	end
	scenario "players' reduced hit points are displayed after a round has been played" do
		sign_in_and_play_1_player_rps
		allow(Kernel).to receive(:rand).and_return(1)
		choose "Rock"
		click_button "Submit"
		click_button "play_again"
		expect(page).to have_content "Sam's HP: 99/100"
		expect(page).to have_content "Computer's HP: 100/100"
	end

end













