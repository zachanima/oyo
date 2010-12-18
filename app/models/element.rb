class Element < ActiveRecord::Base
  belongs_to :page

  scope :ordered, order('position')

  acts_as_list
  has_attached_file :image, :styles => {
    :thumb => '100x100#',
    :small => '240x240>',
    :large => '500x500>'
  }
end
