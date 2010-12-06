class TextsController < ElementsController
  uses_tiny_mce :only => [:new, :edit]
end
