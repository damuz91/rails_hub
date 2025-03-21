class VideosController < ApplicationController
  before_action :set_video, only: [:show, :increment_likes]

  def search
    if params[:query].present?
      @videos = Video.where("title LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @videos = Video.all
    end
  end

  def show
  end

  def increment_likes
    @video.increment!(:likes_count)
    respond_to do |format|
      format.html { redirect_to @video, notice: '¡Gracias por tu apoyo!' }
      format.json { render json: { likes_count: @video.likes_count } }
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

end
