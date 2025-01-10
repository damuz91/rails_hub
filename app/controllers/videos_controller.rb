class VideosController < ApplicationController
  allow_unauthenticated_access only: [:show]
  def show
    @video = Video.first
  end
end
