class UsersController < ApplicationController
  skip_before_filter :authorize
  def show
    @user = find_user
    @timeline = timeline_for(@user)
  end

  private

  def find_user
    User.find(params[:id])
  end

  def timeline_for user
    if visitor.following? user
      user.private_timeline
    else
      user.public_timeline
    end
  end
end
