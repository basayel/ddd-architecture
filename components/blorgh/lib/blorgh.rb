require "blorgh/version"
require "blorgh/engine"

module Blorgh
  mattr_accessor :user_class

  self.user_class = "User" # default configuration in case the main app didn't set it

  class << self
    def user_class
      @@user_class.constantize
    end

    def setup(&_block)
      yield self
    end
  end
end
