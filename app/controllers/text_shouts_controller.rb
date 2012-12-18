class TextShoutsController < ApplicationController

  def create
    @shout = build_shout
    @shout.save
    redirect_to dashboard_path, notice: "Shouted!"
  end

  private

  def build_shout
    current_user.build_shout(build_content).tap do |shout|
      shout.public = params[:private] != "1"
    end
  end

  def build_content
    TextShout.new(params[:text_shout])
  end
end
