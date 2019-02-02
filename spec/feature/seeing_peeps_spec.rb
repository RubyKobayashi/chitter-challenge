require 'pg'

feature 'Viewing peeps in reverse chronological order' do
  scenario 'user sees most recent peep at the top of the page' do

    Peep.create(peep: 'This is my first peep')
    Peep.create(peep: 'This is my second peep')
    Peep.create(peep: 'This is my third peep')

    visit('/chitter')

    expect(page).to have_content('This is my first peep')
    expect(page).to have_content('This is my second peep')
    expect(page).to have_content('This is my third peep')
  end
end
