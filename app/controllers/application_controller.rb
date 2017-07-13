class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_blog
    @current_blog ||= Blog.find_by(subdomain: request.subdomain)
  end
  helper_method :current_blog
end
