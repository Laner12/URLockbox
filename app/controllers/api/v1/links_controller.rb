class Api::V1::LinksController < ApplicationController

  # def index
  #   render json: Link.where(user: params[:user_id])
  # end

  def update
    link = Link.find(params[:id])
    handle_updates(link, link_params)
    redirect_to links_path
  end

  private

  def handle_updates(link, params)
    if params["title"] || params["url"]
      idea.update_attributes(idea_params)
    else
      handle_status(link, params)
    end
  end

  def handle_status(link, params)
    if params["data"] == "read"
      link.update_attributes(read: "true")
    else
      link.update_attributes(read: "false")
    end
  end

    def link_params
      params.permit(:title, :url, :user_id, :data)
    end
end
