require "with_role/version"
require "with_role/active_record"

module WithRole
  class Error < StandardError; end
  # Your code goes here...

  def self.configuration
    @configuration ||= {}
  end

  def self.configure
    yield(configuration)
  end
end

::ActiveRecord::Base.include(::WithRole::ActiveRecord)
