require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expections, false)


describe('places path', {:type => :feature}) do
  it('takes a place and adds it to the place list') do
    visit('/places')
    fill_in('description', :with => 'Rome')
    click_button('Submit')
    expect(page).to have_content('Rome')
  end
end
