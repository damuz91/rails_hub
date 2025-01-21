class VideosController < ApplicationController
  before_action :set_video, only: [:show, :increment_likes]

  allow_unauthenticated_access only: [:show]
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
