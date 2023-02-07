# The Domain Object that contains the business logic
# The repository is expected to return this domain object or
# collection of domain objects
module Blorgh
  class User < Struct.new(:id, :name, :active)
    # business logic goes here
  end
end
