class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id])
    handle_status(@link, link_params)
    render json: @link
  end

  private

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
