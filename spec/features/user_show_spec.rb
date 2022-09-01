require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  user = User.first
  before(:each) do
    visit(user_path(User.first.id))
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

  it 'shows the bio of user' do
    expect(page).to have_content(user.bio)
  end

  it 'shows the three first posts of the user' do
    expect(page).to have_selector('.post-card', count: 1)
  end

  it 'shows a button that allows to see all the posts of the user' do
    expect(page).to have_link('See all posts')
  end

  it 'redirects to the post\'s page when a post is clicked' do
    post = user.posts.first
    click_link(post.title)
    expect(page.current_path).to eql(user_post_path(user_id: user.id, id: post.id))
  end

  it 'redirects to the user\'s post page where all the posts are shown when clicked on "See all posts" button ' do
    click_link('See all posts')
    expect(page.current_path).to eql(user_posts_path(user_id: user.id))
  end
end
