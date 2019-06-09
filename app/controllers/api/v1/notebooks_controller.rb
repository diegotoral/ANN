class Api::V1::NotebooksController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    @notebooks = current_user.notebooks

    respond_with @notebooks
  end

  def create
    @notebook = current_user.notebooks.create!(notebook_params)

    respond_with @notebook, status: :created
  end

  private

  def notebook_params
    params.permit(:id, :name)
  end
end
