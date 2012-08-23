require "updated_after/version"

module UpdatedAfter
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    def updated_after(last_updated_at = nil)
      where("#{table_name}.updated_at > ?", last_updated_at || 0)
    end
  end

  module InstanceMethods
    def updated_after(last_updated_at = nil)
      where("#{table_name}.updated_at > ?", last_updated_at || 0)
    end
  end
end
