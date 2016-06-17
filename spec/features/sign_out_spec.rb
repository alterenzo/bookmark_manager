feature 'sign out' do

		let!(:user) do
			User.create(email: 'user@example.com',
			password: 'secret1234', password_confirmation: 'secret1234')
		end

		def sign_in(email:, password:)
			visit '/sessions/new'
			fill_in :email, with: email
			fill_in :password, with: password
			click_button 'Sign in'
		end

	scenario 'sign outs a logged user' do
		sign_in(email: 'user@example.com', password: 'secret1234')
		click_button('Sign out')
		expect(page.status_code).to eq 200
		expect(page).to have_content('Goodbye')
		expect(page).not_to have_content('Welcome')
	end
end
