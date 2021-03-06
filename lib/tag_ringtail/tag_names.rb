class TagRingtail::TagNames
  include Enumerable

  # Create a new TagNames object, but clear out existing tags
  # and use the provided set instead.
  def self.new_with_names(taggable, names)
    tag_names = new(taggable)
    tag_names.clear
    names.each { |name| tag_names << name }
    tag_names
  end

  def initialize(taggable)
    @taggable = taggable
  end

  def to_a
    taggable.tags.collect &:name
  end

  def <<(name)
    # find an existing tag, or create a new one
    tag = TagRingtail::Tag.where(:name => name).first ||
          TagRingtail::Tag.create(:name => name)

    taggable.tags << tag
  end

  def delete(name)
    taggable.tags.delete TagRingtail::Tag.where(:name => name).first
  end

  def +(array)
    array.each { |name| self.<< name }
    self
  end

  def -(array)
    array.each { |name| self.delete name }
    self
  end

  def each(&block)
    to_a.each &block
  end

  def clear
    taggable.tags.clear
  end

  private

  attr_reader :taggable
end
