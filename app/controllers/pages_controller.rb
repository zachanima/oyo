class PagesController < ApplicationController
  before_filter :find_page, :only => [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  # def show

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => 'The page was successfully created'
    else
      render :action => :new
    end
  end

  # def edit

  def update
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice => 'The page was successfully updated'
    else
      render :action => :edit
    end
  end

  def destroy
    if @page.destroy
      redirect_to pages_path, :notice => 'The page was successfully deleted.'
    else
      redirect_to @page, :alert => 'The page could not be deleted.'
    end
  end

  private
  def find_page
    @page = Page.find_by_id params[:id]
  end
end
