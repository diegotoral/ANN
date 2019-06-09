require 'rails_helper'

RSpec.describe Api::V1::Notebooks::NotesController, type: :controller do
  let(:user) { create(:user) }

  include Devise::Test::ControllerHelpers

  before { sign_in user }

  describe 'GET /api/v1/notebooks/{notebook_id}/notes.json' do
    it 'responds with status 200 OK' do
      notebook = create(:notebook_with_notes, user: user)

      get :index, format: :json, params: { notebook_id: notebook.id }

      expect(response).to have_http_status 200
    end

    it 'responds with all notes within the notebook' do
      notebook = create(:notebook_with_notes, user: user)

      get :index, format: :json, params: { notebook_id: notebook.id }
      ids = json.map { |n| n['id'] }

      expect(ids).to include(*notebook.notes.pluck(:id))
    end
  end

  describe 'GET /api/v1/notebooks/{notebook_id}/notes/{id}.json' do
    it 'responds with status 200 OK' do
      notebook = create(:notebook_with_notes, user: user)
      note = notebook.notes.first

      get :show, format: :json, params: { notebook_id: notebook.id, id: note.id }

      expect(response).to have_http_status 200
    end

    it 'returns details on the specified note' do
      notebook = create(:notebook_with_notes, user: user)
      note = notebook.notes.first

      get :show, format: :json, params: { notebook_id: notebook.id, id: note.id }

      expect(json[:id]).to eq(note.id)
      expect(json[:title]).to eq(note.title)
    end
  end

  describe 'POST /api/v1/notebooks/{notebook_id}/notes.json' do
    it 'responds with status 201 Created' do
      notebook = create(:notebook, user: user)
      params = {
        notebook_id: notebook.id,
        title: 'How to train a dragon'
      }

      post :create, format: :json, params: params

      expect(response).to have_http_status 201
    end

    it 'saves the note within the specified notebook' do
      notebook = create(:notebook, user: user)
      params = {
        notebook_id: notebook.id,
        title: 'How to train a dragon'
      }

      expect {
        post :create, format: :json, params: params
      }.to change(notebook.notes, :count).by(1)
    end

    it 'saves the note with the provided attributes' do
      notebook = create(:notebook, user: user)
      params = {
        notebook_id: notebook.id,
        title: 'How to train a dragon'
      }

      post :create, format: :json, params: params
      note = Note.last

      expect(note.title).to eq('How to train a dragon')
    end
  end

  describe 'PUT /api/v1/notebooks/{notebook_id}/notes/{id}' do
    it 'responds with status 204 no content' do
      notebook = create(:notebook_with_notes, user: user)
      note = notebook.notes.last
      params = {
        id: note.id,
        notebook_id: notebook.id,
        title: 'A nice and short title'
      }

      put :update, format: :json, params: params

      expect(response).to have_http_status 204
    end

    it 'updates the specified note' do
      notebook = create(:notebook_with_notes, user: user)
      note = notebook.notes.last
      params = {
        id: note.id,
        notebook_id: notebook.id,
        title: 'A nice and short title'
      }

      put :update, format: :json, params: params
      note.reload

      expect(note.title).to eq 'A nice and short title'
    end
  end

  describe 'DELETE /api/v1/notebooks/{notebook_id}/notes/{id}.json' do
    it 'responds with status 204 no content' do
      notebook = create(:notebook_with_notes, user: user)
      note = notebook.notes.last
      params = {
        id: note.id,
        notebook_id: notebook.id
      }

      delete :destroy, format: :json, params: params

      expect(response).to have_http_status 204
    end
  end
end
