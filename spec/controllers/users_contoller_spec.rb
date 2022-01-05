require 'rails_helper'

describe UsersController do

  describe '#index' do
    let!(:user) { create(:user) }
    let!(:user1) { create(:user) }

    it 'returns user list' do
      get :index
      response = JSON.parse(response.body)['users']
      binding.pry
      expect(response.first).to include({"email" => user.email})
      expect(response.size).eq to(2)
    end
  end

  describe '#create' do
    context 'params are valid' do
      let!(:params) {
        {
          first_name: 'Lorem',
          last_name: 'test',
          email: 'test@test.com'
        }
      }

      it 'it should create the user' do
        post :create, user: params
        response = JSON.parse(response.body)
        expect(response['message']).eq to("Successfully created the User.")
        expect(response['user']['email']).eq to("test@test.com")
      end
    end

    context 'params are invalid' do
      let!(:params) {
        {
          first_name: '',
          last_name: 'test',
          email: 'test@test.com'
        }
      }

      it 'it should not create the user' do
        post :create, user: params
        response = JSON.parse(response.body)
        expect(response['message'].first).eq to("First name can't be blank")
      end
    end
  end
end
