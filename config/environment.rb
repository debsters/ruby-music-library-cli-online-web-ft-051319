require 'bundler'
Bundler.require

module Concerns
  module ClassMethods
    def destroy_all
      self.all.clear
    end

  end

  module InstanceMethods
    def initialize(name)
      @name = name
    end

    def save
      self.class.all << self
    end

  end

  module Findable

    def find_by_name(name)
      self.all.detect {|s| s.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

  end

end

require_all 'lib'
