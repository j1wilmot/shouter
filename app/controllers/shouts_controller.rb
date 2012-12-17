class ShoutsController < ApplicationController
  def create
    @shout = build_shout
    @shout.save
    redirect_to dashboard_path, notice: "Shouted!"
  end

  private

  def build_shout
    current_user.shouts.new(params[:shout])
  end
end
