require 'rails_helper'

RSpec.describe PostsController, type: :request do
    describe 'GET index' do
        before :each do
            get '/users/index/posts'
        end

        it 'the response status is correct, that is it should return code 200' do
            expect(response).to have_http_status(:ok)
        end

        it 'renders the correct template' do
            expect(response).to render_template('posts/index')
        end

        it 'response body includes correct placeholder text' do
            expect(response.body).to include('Here is the list of all the posts in the app.')
        end
    end

    describe 'GET show' do
        before :each do
            get '/users/index/posts/index'
        end

        it 'the response status is correct, that is it should return code 200' do
            expect(response).to have_http_status(:ok)
        end

        it 'renders the correct template' do
            expect(response).to render_template('posts/show')
        end

        it 'response body includes correct placeholder text' do
            expect(response.body).to include('Here is the list of all the posts by the selected user.')
        end
    end
end
