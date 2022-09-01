require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    before :each do
      @user = User.first
      get user_posts_path(@user)
    end

    it 'the response status is correct, that is it should return code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Number of posts: 1')
    end
  end

  describe 'GET show' do
    before :each do
      @user = User.first
      @post = Post.first
      get user_post_path(@user, @post)
    end

    it 'the response status is correct, that is it should return code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Pizza Recipe')
    end
  end
end
