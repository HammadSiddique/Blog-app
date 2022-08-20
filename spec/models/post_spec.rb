require 'rails_helper'

RSpec.describe Post, type: :model do
    user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.', posts_counter: 0)
    post = Post.create(title: 'Pizza Recipe', text: 'Recipe for a tasty pepporoni pizza', comments_counter: 0, likes_counter: 0, author_id: user.id)

    describe "Tests for post model validation" do
        it 'post should be valid' do
            expect(post).to be_valid
        end

        it 'Post should be invalid because of title length exceeding the limit' do
            post.title = 'a' * 255
            expect(post).to_not be_valid
        end

        it 'Post like and comments counter should 0 or greater than 0 AND must be an integer' do
            post.comments_counter = 'hello'
            post.likes_counter = -5
            expect(post).to_not be_valid
        end 
    end
end