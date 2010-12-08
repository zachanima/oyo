class PagesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :find_page, :only => [:show, :edit, :update, :destroy, :manage]

  def index
    @page = Page.first
    if @page
      redirect_to @page
    end
  end

  # def show

  def new
    @page = Page.new
    render :layout => 'manage'
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to manage_page_path(@page), :notice => 'The page was successfully created'
    else
      render :action => :new
    end
  end

  def edit
    render :layout => 'manage'
  end

  def update
    if @page.update_attributes(params[:page])
      redirect_to manage_page_path(@page), :notice => 'The page was successfully updated'
    else
      render :action => :edit
    end
  end

  def destroy
    if @page.destroy
      redirect_to pages_path, :notice => 'The page was successfully deleted'
    else
      redirect_to @page, :alert => 'The page could not be deleted'
    end
  end

  def manage
    render :layout => 'manage'
  end

  private
  def find_page
    @page = Page.find_by_id params[:id]
  end
end
