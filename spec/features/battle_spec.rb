feature 'allow players to input names and display them' do
  scenario 'fillable form appears' do
    visit ('/')
    expect(page).to have_content ("Please enter your name")
  end

  scenario 'form accepts name and displays it' do
    sign_in_and_play
    expect(page).to have_content ("Guybrush Threepwood")
  end
end

feature 'allow players to have 100 HP to start with' do
  scenario 'opening the play page, this is viewable' do
    visit '/'
    sign_in_and_play
    expect(page).to have_content ("Player 1 HP: 100")
  end
end

feature 'allow users to attack each other' do
  scenario 'Player 1 should be able to attack player 2' do
    visit '/'
    sign_in_and_play
    find_button('Attack Elaine Marley').click
    expect(page).to have_content ('Player 2 HP: 80')
  end
end
