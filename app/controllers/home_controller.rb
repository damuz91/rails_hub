class HomeController < ApplicationController
  allow_unauthenticated_access only: [:index]
  def index
    @videos = Video.all
  end
end
