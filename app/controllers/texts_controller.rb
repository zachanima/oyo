class TextsController < ElementsController
  uses_tiny_mce :only => [:new, :edit], :options => {
    :content_css => '/stylesheets/style.css'
  }
end
