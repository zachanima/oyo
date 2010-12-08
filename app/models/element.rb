class Element < ActiveRecord::Base
  belongs_to :page

  scope :ordered, order('position')

  has_attached_file :image, :styles => {
    :thumb => '100x100#',
    :small => '240x240>'
  }
end
