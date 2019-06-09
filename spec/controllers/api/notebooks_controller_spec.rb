require 'rails_helper'

RSpec.describe Api::V1::NotebooksController, type: :controller do
  let(:user) { create(:user) }

  include Devise::Test::ControllerHelpers

  before { sign_in user }

  describe 'GET /api/v1/notebooks.json' do
    it 'responds with status 200 OK' do
      get :index, format: :json

      expect(response).to have_http_status 200
    end

    it 'responds with a collection of notebooks for the current user' do
      create_list(:notebook, 2, user: user)

      get :index, format: :json

      ids = json.map { |r| r['id'] }
      expect(ids).to include(*user.notebooks.pluck(:id))
    end
  end

  describe 'POST /api/v1/notebooks.json' do
    it 'responds with status 201 Created' do
      params = {
        name: 'Interview Questions'
      }

      post :create, format: :json, params: params

      expect(response).to have_http_status 201
    end

    it 'saves the specified notebook to the current user' do
      params = {
        name: 'Interview Questions'
      }

      expect {
        post :create, format: :json, params: params
      }.to change(Notebook, :count).by(1)
    end
  end

  describe 'GET /api/v1/notebooks/{id}.json' do
    it 'responds with status 200 OK' do
      notebook = create(:notebook, user: user)

      get :show, format: :json, params: { id: notebook.id }

      expect(response).to have_http_status 200
    end

    it 'responds with details on the notebook' do
      notebook = create(:notebook, user: user, name: 'Books')

      get :show, format: :json, params: { id: notebook.id }

      expect(json['name']).to eq(notebook.name)
    end
  end

  describe 'PATCH /api/v1/notebooks/{id}.json' do
    it 'responds with status 204 no content' do
      notebook = create(:notebook, name: 'Booquis', user: user)
      params = { id: notebook.id, name: 'Books' }

      patch :update, format: :json, params: params

      expect(response).to have_http_status 204
    end

    it 'updates the specified attributes on the notebook' do
      notebook = create(:notebook, name: 'Booquis', user: user)
      params = { id: notebook.id, name: 'Books' }

      patch :update, format: :json, params: params
      notebook.reload

      expect(notebook.name).to eq('Books')
    end
  end

  describe 'DELETE /api/v1/notebooks/{id}.json' do
    it 'responds with status 204 no content' do
      notebook = create(:notebook, user: user)

      delete :destroy, format: :json, params: { id: notebook.id }

      expect(response).to have_http_status 204
    end

    it 'removes the specified notebook once and for all' do
      notebook = create(:notebook, user: user)

      expect{
        delete :destroy, format: :json, params: { id: notebook.id }
      }.to change(Notebook, :count).by(-1)
    end
  end
end
