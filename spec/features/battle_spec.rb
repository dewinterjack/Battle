feature 'allow players to input names and display them' do
  scenario 'fillable form appears' do
    visit ('/')
    expect(page).to have_content ("PLEASE ENTER YOUR NAME")
  end

  scenario 'form accepts name and displays it' do
    sign_in_and_play
    expect(page).to have_content ("GUYBRUSH THREEPWOOD VS. ELAINE MARLEY")
  end
end

feature 'allow players to have 100 HP to start with' do
  scenario 'opening the play page, this is viewable' do
    visit '/'
    sign_in_and_play
    expect(page).to have_content ("HP 100")
  end
end

feature 'allow users to attack each other' do
  scenario 'Player 1 should be able to attack player 2' do
    visit '/'
    sign_in_and_play
    find_button('Attack Elaine Marley').click
    expect(page).to have_content ('HP 80')
  end

  scenario 'Player 2 should be able to attack player 1' do
    visit '/'
    sign_in_and_play
    find_button('Attack Guybrush Threepwood').click
    expect(page).to have_content ('HP 80')
  end

  scenario 'Player is sent with attack' do

  end

end
