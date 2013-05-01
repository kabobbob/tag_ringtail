require 'rails/engine'

class TagRingtail::Engine < Rails::Engine
  # set our engine name
  engine_name :tag_ringtail

  ActiveSupport.on_load :active_record do
    # this is run when Rails loads ActiveRecord, and is
    # within the context of ActiveRecord::Base.
    include TagRingtail::ActiveRecord
  end
end
