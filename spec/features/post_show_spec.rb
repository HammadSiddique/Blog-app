require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  user = User.first
  post = user.posts.first
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
    commentor_id = post.comments.first.user_id
    commentor = User.find(commentor_id).name
    expect(page).to have_content(commentor)
  end

  it 'shows the text of the comment' do
    expect(page).to have_content(post.comments.first.text)
  end
end
