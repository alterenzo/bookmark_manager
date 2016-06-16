feature 'User Sign in' do

  let!(:user) do
    User.create(email: 'joe.bloggs@email.com', password: 'strongpassword', password_confirmation: 'strongpassword')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,password:  user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
