class LinksController < ApplicationController

  def index
    @links = Link.where(user: current_user)
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash.now[:danger] = @link.errors.full_messages.join(", ")
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end
end
