require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.',
                     posts_counter: 0)
  post = Post.create(title: 'Pizza Recipe', text: 'Recipe for a tasty pepporoni pizza', comments_counter: 0,
                     likes_counter: 0, user_id: user.id)
  before(:each) do
    visit(user_path(user.id))
  end

  it 'shows the username of the the users' do
    expect(page).to have_content(user.name)
  end

  it 'shows the profile photo of users' do
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  it 'shows the number of post of each user' do
    expect(page).to have_content('Number of posts: 1')
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
