require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.',
                     posts_counter: 0)
  post = Post.create(title: 'Pizza Recipe', text: 'Recipe for a tasty pepporoni pizza', comments_counter: 0,
                     likes_counter: 0, user_id: user.id)
  comment = Comment.create(user:, post:, text: 'Testing comment')
  before(:each) do
    visit(user_post_path(user.id, post.id))
  end

  it 'shows the title of the post' do
    expect(page).to have_content(post.title)
  end

  it 'shows the name of the author of the post' do
    expect(page).to have_content(user.name)
  end

  it 'shows the number of comments of each post' do
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end

  it 'shows the number of likes of each post' do
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'shows the body of post' do
    expect(page).to have_content(post.text)
  end

  it 'shows the name of the commentor' do
    visit user_post_path(user, post)
    expect(page).to have_content(comment.user.name)
  end

  it 'shows the text of the comment' do
    expect(page).to have_content(post.comments.first.text)
  end
end
