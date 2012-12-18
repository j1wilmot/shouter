class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  before_filter :authorize

  def visitor
    @_visitor ||= current_user || Guest.new
  end

  helper_method :visitor
end
