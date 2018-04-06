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

  scenario 'HP cannot go lower than 0' do
    visit '/'
    game = Game.new("Jack","Jill")
    game.player_1.hp = 0
    game.player_1.lowerHP(game.player_1)
    expect(game.player_1.hp).to eq 0
  end

  scenario 'A winner is shown when a player HP' do

  end

  scenario 'A player cannot make a turn more than once in a row' do

  end

end
