require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.',
                     posts_counter: 0)
  post = Post.create(title: 'Pizza Recipe', text: 'Recipe for a tasty pepporoni pizza', comments_counter: 0,
                     likes_counter: 0, user_id: user.id)
  like = Like.create(post_id: post.id, user_id: user.id)

  describe 'Tests for like model validation' do
    it 'like should be valid' do
      expect(like).to be_valid
    end

    it 'Increases the likes counter' do
      counter = Post.find(post.id).likes_counter
      like.update_likes_counter
      expect(Post.find(post.id).likes_counter).to eq(counter + 1)
    end
  end
end
