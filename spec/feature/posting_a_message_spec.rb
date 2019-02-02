feature 'Posting a message' do
  scenario 'posting a peep to Chitter' do
    visit('/chitter/new')
    fill_in('peep', with: 'This is my first peep')
    click_button('Submit')
    expect(page).to have_content('This is my first peep')
  end
end
