module ApplicationHelper
  def active_class page
    'class="active"' if page == @page or page.id == @page.parent_id
  end
end
