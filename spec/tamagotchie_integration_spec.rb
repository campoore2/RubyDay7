require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('tamagotchi path', {:type => :feature}) do
  it('creates a new Tamagotchi') do
    visit('/tamagotchi')
    fill_in('name', :with => 'lil dragon')
    click_button('New')
    expect(page).to have_content('lil dragon')
  end

  it('displays a Tamagotchi pet') do
    visit('/tamagotchi/view/0')
    expect(page).to have_content('lil dragon')
    expect(page).to have_content('Food: 10')
  end

end
