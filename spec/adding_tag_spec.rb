feature 'Adding tag' do

  scenario 'I can add a new tag' do
    visit('/links/new')
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tags', with: 'zombo'
    click_button 'Add link'
    link = Link.first
    expect(link.tags.map{ |x| x.name }).to include ('zombo')
  end

  scenario 'adding more than one tag' do
    visit('/links/new')
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tags', with: 'zombo whatever'
    click_button 'Add link'
    link = Link.first
    expect(link.tags.map{ |x| x.name }).to include('zombo', 'whatever')

  end
end
