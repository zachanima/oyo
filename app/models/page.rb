class Page < ActiveRecord::Base
  belongs_to :page, :primary_key => :parent_id
  has_many :pages, :primary_key => :parent_id
  has_many :elements, :dependent => :destroy

  attr_accessible :title, :url, :parent_id
  validates_presence_of :title
end
