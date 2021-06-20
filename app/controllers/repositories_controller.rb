class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:edit, :update, :show, :destroy]

  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def create
    @repository = Repository.new(repository_params)
    if @repository.save
      flash[:notice]= "Repository added successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @repository.update(repository_params)
      flash[:notice] = "User edited successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @repository.destroy
    flash[:notice] = "Repository deleted successfully"
    redirect_to root_path
  end

  private

  def repository_params
    params.require(:repository).permit(:name,:description,:owner)
  end

  def set_repository
    @repository = Repository.find(params[:id])
  end
end