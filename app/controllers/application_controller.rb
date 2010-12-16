class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def find_page
    @page = Page.find_by_id(params[:page_id] || params[:gallery_id] || params[:id])
  end

  def authenticate
    authenticate_or_request_with_http_basic do |login, password|
      login == 'michael' && password == 'secret'
    end
  end
end
