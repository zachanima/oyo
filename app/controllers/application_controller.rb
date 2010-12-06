class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def find_page
    @page = Page.find_by_id(params[:page_id] || params[:id])
  end
end
