class PagesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :find_page, :only => [:show, :edit, :update, :destroy, :manage]
  before_filter :find_class, :only => [:new, :create]

  def index
    @page = Page.first
    if @page
      redirect_to @page
    end
  end

  # def show

  def new
    @page = @class.new
    render :layout => 'manage'
  end

  def create
    @page = @class.new params[:page]
    if @page.save
      redirect_to manage_path(@page), :notice => 'The page was successfully created'
    else
      render :new, :layout => 'manage'
    end
  end

  def edit
    render :layout => 'manage'
  end

  def update
    if @page.update_attributes params[:page]
      redirect_to manage_path(@page), :notice => 'The page was successfully updated'
    else
      render :edit, :layout => 'manage'
    end
  end

  def destroy
    if @page.destroy
      redirect_to pages_path, :notice => 'The page was successfully deleted'
    else
      redirect_to @page, :alert => 'The page could not be deleted'
    end
  end

  def sort
    Page.all.each do |page|
      page.position = (params['page'].index(page.id.to_s) || 0) + 1
      page.save
    end
    render :nothing => true
  end

  def manage
    render :layout => 'manage'
  end
end
