feature 'Sign out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'signing out a logged user' do
    sign_in(email: 'test@test.com', password: 'test')
    expect(page.status_code).to eq 200

    click_button 'Sign Out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome, test@test.com'
  end
end
