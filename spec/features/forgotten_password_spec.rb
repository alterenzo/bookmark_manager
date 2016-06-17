feature 'resetting password' do

  before do
    sign_up
    Capybara.reset!
  end

  let(:user) { User.first }


	scenario 'user can reset the password if it is forgotton' do
		visit('/sessions/new')
		click_button('Forgot password')
		expect(page).to have_content("Please enter your email address")
	end

	let!(:registered_user) do
		User.create(email: 'user@example.com',
		password: 'secret1234', password_confirmation: 'secret1234')
	end

	scenario 'user inputs an invalid email address at password reset' do
		visit('/users/password_reset')
		fill_in(:email, with: 'e@test')
		click_button('Submit')
		expect(page).to have_content('Email not found, please re-enter your email.')
	end

	scenario 'when user enters valid email address, they receive a confirmation message' do
		visit('/users/password_reset')
		fill_in(:email, with: 'user@example.com')
		click_button('Submit')
		expect(page).to have_content('Please check your email for further instructions')
	end

end
