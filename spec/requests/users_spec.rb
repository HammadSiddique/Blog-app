require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET index' do
    before :each do
      get '/users'
    end

    it 'the response status is correct, that is it should return code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is the list of all the users in the app.')
    end
  end

  describe 'GET show' do
    before :each do
      get '/users/index'
    end

    it 'the response status is correct, that is it should return code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is the details of the selected user.')
    end
  end
end
