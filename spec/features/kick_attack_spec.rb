feature 'kick attack' do
  scenario 'kick attack Player 2' do
    sign_in_and_play
    click_button 'Kick attack'
    expect(page).to have_content 'Dave kicked Mittens'
  end
  scenario 'kick attack Player 1' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Kick attack'
    expect(page).to have_content 'Mittens kicked Dave'
  end

 end