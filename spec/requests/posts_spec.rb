require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) { get user_posts_path(1) }
    it 'should have a response status code of 200 for success' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'should have correct placeholder' do
      expect(response.body).to include('This page displays the users post')
    end
  end

  describe 'GET #show' do
    before(:each) { get user_post_path user_id = 1, id = 1 }
    it 'should have a response status code of 200 for success' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'should have correct placeholder' do
      expect(response.body).to include('This page displays the users post details')
    end
  end
end
