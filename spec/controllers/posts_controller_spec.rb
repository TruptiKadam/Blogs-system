require 'rails_helper'

describe PostsController do

  describe '#index' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    it 'returns post list' do
      get :index
      response = JSON.parse(response.body)['posts']
      expect(response.first).to include({"title" => user.title})
      expect(response.size).eq to(1)
    end
  end

  describe '#create' do
    context 'params are valid' do
      let(:user) { create(:user) }
      let!(:params) {
        {
          title: 'Lorem',
          description: 'test',
          user_id: user.id
        }
      }

      it 'it should create the post' do
        post :create, post: params
        response = JSON.parse(response.body)
        expect(response['message']).eq to("Successfully created the Post.")
        expect(response['post']['title']).eq to("Lorem")
      end
    end

    context 'params are invalid' do
      let(:user) { create(:user) }
      let!(:params) {
        {
          title: '',
          description: 'test',
          user_id: user.id
        }
      }

      it 'it should not create the post' do
        post :create, post: params
        response = JSON.parse(response.body)
        expect(response['message'].first).eq to("Title can't be blank")
      end
    end
  end
end
