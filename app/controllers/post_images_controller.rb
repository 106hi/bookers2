class PostImagesController < ApplicationController
  def new
  end

  def index
    @post_images = PostImage.all
  end

  def show
  end
end
