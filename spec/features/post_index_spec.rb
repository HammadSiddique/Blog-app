require 'rails_helper'

RSpec.describe 'post_index', type: :feature do
  user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.',
                     posts_counter: 0)
  post = Post.create(title: 'Pizza Recipe', text: 'Recipe for a tasty pepporoni pizza', comments_counter: 0,
                     likes_counter: 0, user_id: user.id)

  before(:each) do
    visit user_posts_path(user.id)
  end

  it 'shows the username of the the user' do
    expect(page).to have_content(user.name)
  end

  it 'shows the profile photo of user' do
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  it 'shows the number of post of each user' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'shows the post\'s title' do
    expect(page).to have_content(post.title)
  end

  it 'shows the post\'s body' do
    expect(page).to have_content(post.text)
  end

  it 'shows the post\'s comments' do
    expect(page).to have_content('Testing comment')
  end

  it 'shows the number of comments of each post' do
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end

  it 'shows the number of likes of each post' do
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'shows the section for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects to the post\'s page when a post is clicked' do
    click_link(post.title)
    expect(page.current_path).to eql(user_post_path(user_id: user.id, id: post.id))
  end
end
