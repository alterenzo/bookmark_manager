feature 'Create links' do

  scenario 'I can add a new link' do
    visit ('/links/new')
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Add link'

    # expect(current_path).to eq '/links'
    expect(page.status_code).to eq 200


    within 'ul#links' do
      expect(page).to have_content 'This is Zombocom'
    end
  end

end
