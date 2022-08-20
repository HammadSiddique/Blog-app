require 'rails_helper'

RSpec.describe Comment, type: :model do
    user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.', posts_counter: 0)
    post = Post.create(title: 'Pizza Recipe', text: 'Recipe for a tasty pepporoni pizza', comments_counter: 0, likes_counter: 0, author_id: user.id)
    comment = Comment.create(post_id: post.id, author_id: user.id, text: 'Testing comment')

    describe "Tests for comment model validation" do
        it 'comment should be valid' do
            expect(comment).to be_valid
        end
        
        it 'Increases the comments counter' do
            counter = Post.find(post.id).comments_counter
            comment.update_comments_counter
            expect(Post.find(post.id).comments_counter).to eq(counter + 1)
        end
    end
end
