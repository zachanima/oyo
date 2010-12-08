class ElementsController < ApplicationController
  before_filter :find_page
  before_filter :find_element, :except => [:new, :create]
  before_filter :find_class, :only => [:new, :create]

  def new
    @element = @page.elements.new
    @element.type = @class
  end

  def create
    @element = @page.elements.new(params[:element])
    @element.type = @class
    if @element.save
      redirect_to @page, :notice => 'The element was successfully created'
    else
      render :action => :new
    end
  end

  # def edit

  def update
    if @element.update_attributes(params[:element])
      redirect_to @page, :notice => 'The element was successfully updated'
    else
      render :action => :edit
    end
  end

  def destroy
    if @element.destroy
      flash[:notice] = 'The element was successfully deleted'
    else
      flash[:notice] = 'The element could not be deleted'
    end
    redirect_to @page
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

  def find_class
    @class = params[:controller].titleize.singularize.constantize
  end
end
