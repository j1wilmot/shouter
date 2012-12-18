class PhotoShoutsController < ApplicationController
  def create
    @shout = build_shout
    @shout.save
    redirect_to dashboard_path, notice: "Shouted!"
  end

  private

  def build_shout
    current_user.build_shout(build_content, get_public)
  end

  def build_content
    PhotoShout.new(params[:photo_shout])
  end

  def get_public
    params[:public]
  end
end
