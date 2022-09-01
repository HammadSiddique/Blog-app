require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.',
                     posts_counter: 0)
  before(:each) do
    visit root_path
  end

  it 'shows the username of the the users' do
    expect(page).to have_content(user.name)
  end

  it 'shows the profile photo of users' do
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  it 'shows the number of post of each user' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'redirects to the user show page when user when a name is clicked' do
    @user2 = User.create(name: 'Luke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Coach from Germany.',
                         posts_counter: 0)
    visit users_path
    click_on @user2.name
    expect(page).to have_current_path(user_path(@user2))
  end
end
