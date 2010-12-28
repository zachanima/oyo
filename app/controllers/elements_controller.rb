class ElementsController < ApplicationController
  before_filter :find_page
  before_filter :find_element, :except => [:new, :create]
  before_filter :find_class, :only => [:new, :create]

  def new
    @element = @class.new
    render :layout => 'manage'
  end

  def create
    @element = @class.new params[:element]
    @element.page = @page

    if @element.save
      redirect_to manage_path(@page), :notice => 'The element was successfully created'
    else
      render :new, :layout => 'manage'
    end
  end

  def edit
    render :layout => 'manage'
  end

  def update
    if @element.update_attributes params[:element]
      redirect_to manage_path(@page), :notice => 'The element was successfully updated'
    else
      render :edit, :layout => 'manage'
    end
  end

  def destroy
    if @element.destroy
      flash[:notice] = 'The element was successfully deleted'
    else
      flash[:notice] = 'The element could not be deleted'
    end
    redirect_to manage_page_path @page
  end

  def sort
    @page.elements.each do |element|
      element.position = params['element'].index(element.id.to_s) + 1
      element.save
    end
    render :nothing => true
  end

  private
  def find_element
    @element = Element.find_by_id params[:id]
  end
end
