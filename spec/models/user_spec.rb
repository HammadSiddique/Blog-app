require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Bill', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Chef from Ireland.',
                     posts_counter: 0)

  describe 'Tests for User model validation' do
    it 'User should be valid' do
      expect(user).to be_valid
    end

    it 'User posts counter should 0 or greater than 0 AND must be an integer' do
      user.posts_counter = 'hello'
      user.posts_counter = -5
      expect(user).to_not be_valid
    end

    it 'User name should not be nil' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
