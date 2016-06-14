require 'spec_helper'

feature 'Creating Links' do
	scenario "it adds the site's address and title to the bookmark manager" do
		visit '/links/new'
		fill_in('url', with: "www.thisisatest.com/")
		fill_in('title', with: "This is a test")
		click_button("Create link")
		expect(current_path).to eq '/links'

		within 'ul#links' do
			expect(page).to have_content('This is a test')
		end
	end
end
