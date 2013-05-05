module TagRingtail::ActiveRecord
  def self.included(base)
    # include our class methods
    base.extend TagRingtail::ActiveRecord::ClassMethods
  end

  def tag_names
    @tag_names ||= TagRingtail::TagNames.new self
  end

  def tag_names=(names)
    if names.is_a?(TagRingtail::TagNames)
      @tag_names = names
    else
      # convert the array of strings to a TagNames object
      @tag_names = TagRingtail::TagNames.new_with_names self, names
    end
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
