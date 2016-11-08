class LinksController < ApplicationController

  def index
    @links = Link.where(user: current_user)
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "Successfully Created New Link!"
      redirect_to links_path
    else
      flash.now[:danger] = "Invalid inputs, Please try again!"
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Successfully Updated!"
      redirect_to links_path
    else
      flash[:danger] = "Unsuccessful Update!"
      redirect_to edit_link_path(@link)
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :user_id)
    end
end
