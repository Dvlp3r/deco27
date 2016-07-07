class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :redirect_if_old



  protected

  # def redirect_if_old
  #   if request.host == 'deco27.net/htm'
  #     redirect_to "#{request.protocol}new.com#{request.fullpath}", :status => :moved_permanently
  #   end
  # end
end
