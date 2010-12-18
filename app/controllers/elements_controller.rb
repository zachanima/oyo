class ElementsController < ApplicationController
  before_filter :find_page
  before_filter :find_element, :except => [:new, :create]
  before_filter :find_class, :only => [:new, :create]

  def new
    @element = @page.elements.new
    @element.type = @class
    render :layout => 'manage'
  end

  def create
    @element = @page.elements.new(params[:element])
    @element.type = @class
    if @element.save
      if @page.type == 'Gallery'
        redirect_to manage_gallery_path(@page), :notice => 'The element was successfully created'
      else
        redirect_to manage_page_path(@page), :notice => 'The element was successfully created'
      end
    else
      render :action => :new, :layout => 'manage'
    end
  end

  def edit
    render :layout => 'manage'
  end

  def update
    if @element.update_attributes(params[:element])
      if @page.type == 'Gallery'
        redirect_to manage_gallery_path(@page), :notice => 'The element was successfully updated'
      else
        redirect_to manage_page_path(@page), :notice => 'The element was successfully updated'
      end
    else
      render :action => :edit, :layout => 'manage'
    end
  end

  def destroy
    if @element.destroy
      flash[:notice] = 'The element was successfully deleted'
    else
      flash[:notice] = 'The element could not be deleted'
    end
    redirect_to manage_page_path(@page)
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
