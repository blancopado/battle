feature 'Game over' do
  scenario 'Game is over when someone has zero hit points' do
    sign_in_and_play
    10.times do
      attack_and_confirm
    end
    click_button 'Attack'
    expect(page).to have_content "Mittens lost!"
  end
end

