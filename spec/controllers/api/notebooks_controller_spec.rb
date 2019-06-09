require 'rails_helper'

RSpec.describe Api::V1::NotebooksController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET /api/v1/notebooks.json' do
    context 'as a unauthenticated user' do
      it 'responds with status 401 ' do
        get :index, format: :json

        expect(response).to have_http_status 401
      end
    end

    context 'as an authenticated user' do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it 'responds with status 200 OK' do
        get :index, format: :json

        expect(response).to have_http_status 200
      end

      it 'responds with a collection of notebooks for the current user' do
        create_list(:notebook, 2, user: user)

        get :index, format: :json

        json = JSON.parse(response.body)
        ids = json.map { |r| r['id'] }

        expect(ids).to include(*user.notebooks.pluck(:id))
      end
    end
  end

  describe 'POST /api/v1/notebooks.json' do
    context 'as an authenticated user' do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it 'responds with status 201 Created' do
        params = {
          name: 'Interview Questions'
        }

        post :create, format: :json, params: params

        expect(response).to have_http_status 201
      end
    end
  end
end
