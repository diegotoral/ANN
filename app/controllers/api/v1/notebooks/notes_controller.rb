class Api::V1::Notebooks::NotesController < Api::V1::BaseController
  def index
    respond_with notebook.notes
  end

  def show
    @note = notebook.notes.find(params[:id])

    respond_with @note
  end

  def create
    @note = notebook.notes.create!(note_params)

    respond_with @note, status: :created
  end

  def update
    @note = notebook.notes.find(params[:id])
    @note.update(note_params)

    respond_with @note
  end

  def destroy
    @note = notebook.notes.find(params[:id])
    @note.destroy

    respond_with @note
  end

  private

  def notebook
    @notebook ||= current_user.notebooks.find(params[:notebook_id])
  end

  def note_params
    params.permit(:id, :title, :body)
  end
end
