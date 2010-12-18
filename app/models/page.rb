class Page < ActiveRecord::Base
  has_many :elements, :dependent => :destroy

  attr_accessible :title, :url
  validates_presence_of :title
end
