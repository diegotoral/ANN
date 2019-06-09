class Api::V1::NotebooksController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    @notebooks = current_user.notebooks

    respond_with @notebooks
  end

  def show
    @notebook = current_user.notebooks.find(params[:id])

    respond_with @notebook
  end

  def create
    @notebook = current_user.notebooks.create!(notebook_params)

    respond_with @notebook, status: :created
  end

  def update
    @notebook = current_user.notebooks.find(params[:id])
    @notebook.update(notebook_params)

    respond_with @notebook
  end

  def destroy
    @notebook = current_user.notebooks.find(params[:id])

    @notebook.destroy

    respond_with @notebook
  end

  private

  def notebook_params
    params.permit(:id, :name)
  end
end
