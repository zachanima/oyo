class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :manage_path

  private
  def find_page
    @page =
      Page.find_by_id(params[:page_id]) ||
      Page.find_by_id(params[:gallery_id]) ||
      Page.find_by_id(params[:id])
  end

  def authenticate
    authenticate_or_request_with_http_basic do |login, password|
      login == 'michael' && password == 'secret'
    end
  end

  def find_class
    @class = params[:controller].titleize.singularize.constantize
  end

  # Call manage path from page type.
  # TODO: Make page type default to 'page' in the database.
  def manage_path page
    send ['manage', (page.type || 'page').to_s.downcase, 'path'] * '_', page
  end
end
