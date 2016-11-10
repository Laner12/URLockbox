class LinksController < ApplicationController

  def index
    @links = Link.where(user: current_user)
  end

  def create
    @link = Link.new(secondary_link_params)
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
    if @link.update(secondary_link_params)
      flash[:success] = "Successfully Updated!"
      redirect_to links_path
    else
      flash[:danger] = "Unsuccessful Update!"
      redirect_to edit_link_path(@link)
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :user_id, :tags)
    end

    def secondary_link_params
      altered_params = link_params
      altered_params[:tags] = sanitize_tag(altered_params[:tags])
      altered_params
    end

    def sanitize_tag(input)
      sanitized = input.downcase.split(',').uniq
      create_tag(sanitized)
    end

    def create_tag(tag_collection)
      tag_collection.map { |word| Tag.find_or_create_by(name: word.strip) }
    end
end
