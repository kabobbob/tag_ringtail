module TagRingtail::ActiveRecord
  def self.included(base)
    # include our class methods
    base.extend TagRingtail::ActiveRecord::ClassMethods
  end

  module ClassMethods
    # Set up the underlying tag associations in the model
    def has_many_tags
      has_many :taggings, :class_name => 'TagRingtail::Tagging',
        :as => :taggable, :dependent => :destroy
      has_many :tags,     :class_name => 'TagRingtail::Tag',
        :through => :taggings
    end
  end
end
