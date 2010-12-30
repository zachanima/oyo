class TextsController < ElementsController
  uses_tiny_mce :only => [:new, :edit], :options => {
    :content_css => '/stylesheets/style.css',
    :theme => 'advanced',
    :theme_advanced_buttons1 => %w[bold italic strikethrough separator bullist numlist separator undo redo separator link unlink] * ',',
    :theme_advanced_buttons2 => '',
    :theme_advanced_buttons3 => ''
  }
end
