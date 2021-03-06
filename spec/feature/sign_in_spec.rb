feature 'On sign-in' do

  scenario 'login is confirmed if details are correct' do
    sign_in
    expect(page).to have_content 'Logged in as: user1'
  end

  scenario 'the user can log-out afterwards' do
    sign_in
    click_button 'Logout'
    expect(page).to_not have_content 'Logged in as: user1'
    expect(page).to have_content 'Logged out succesfully'
  end

  context 'Failure message displays if the following are incorrect:' do
    scenario 'username' do
      sign_in(username: 'userX')
      expect(page).to_not have_content 'logged in'
      expect(page).to have_content 'Login details incorrect'
    end
    scenario 'password' do
      sign_in(password: 'passwordX')
      expect(page).to_not have_content 'logged in'
      expect(page).to have_content 'Login details incorrect'
    end
  end

end
