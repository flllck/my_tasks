require 'rails_helper'

feature 'respond with json', "
" do
  scenario 'respond with JSON ok message' do
    visit projects_path
    expect(page).to have_content('ok')
  end
end