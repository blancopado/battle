feature 'Starting a new game from the gameover page' do
  scenario 'starting a new game' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(10)
    10.times do
      attack_and_confirm
    end
    click_button 'Attack'
    click_button 'New game'
    expect(page).to have_content 'Sign in to play'
  end
end
