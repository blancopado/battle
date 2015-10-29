feature 'hit_points' do
  scenario 'player 1 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Dave: 60HP'
  end
  scenario 'player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end
  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    attack_and_confirm
    attack_and_confirm
    expect(page).not_to have_content 'Dave: 60HP'
    expect(page).to have_content 'Dave: 50HP'
  end
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end
end

