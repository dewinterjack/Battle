def sign_in_and_play
  visit ('/')
  fill_in('player1_name', :with => 'Guybrush Threepwood' )
  fill_in('player2_name', :with => 'Elaine Marley' )
  find_button('Submit').click
end


