require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  before(:each) do
    visit root_path
  end

  it 'shows the username of the the users' do
    expect(page).to have_content('Bill')
  end

  it 'shows the profile photo of users' do
    expect(page).to have_selector("img[src='#{User.first.photo}']")
  end

  it 'shows the number of post of each user' do
    expect(page).to have_content("Number of posts: #{User.first.posts_counter}")
  end

  it 'redirects to the user show page when user when a name is clicked' do
    user = User.first
    click_on user.name, match: :first
    expect(page.current_path).to eql(user_path(id: user.id))
  end
end
