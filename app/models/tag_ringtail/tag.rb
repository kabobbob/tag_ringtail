class TagRingtail::Tag < ActiveRecord::Base
  has_many :taggings, :class_name => 'TagRingtail::Tagging', :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
end
