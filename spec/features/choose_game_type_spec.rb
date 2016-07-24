feature 'Choose game type' do
	before do
		sign_in_and_play_1_player
	end
	scenario 'allows user to choose Rock Paper Scissors game type' do
		choose 'Rock, Paper, Scissors, Lizard, Spock'
		click_button "Submit"
		expect(page).to have_content "RPSLS"
		expect(page).to have_content "Rock"
	end
	scenario 'allows user to choose Fantasy Battle game type' do
		choose 'Fantasy'
		click_button "Submit"
		expect(page).to have_content "Fantasy"
		expect(page).to have_content "Sword"
	end
	scenario 'allows user to choose Space Battle game type' do
		choose 'Space'
		click_button "Submit"
		expect(page).to have_content "Space"
		expect(page).to have_content "Missile"
	end
end
