feature 'Switching_turns' do
  scenario 'switches turns after an attack' do
  	sign_in_and_play
  	expect(page).to have_content "Dave's turn"
  	click_link 'Attack'
  	click_link 'OK'
  	expect(page).to have_content "Mittens's turn"
  end

end