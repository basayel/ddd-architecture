# The Domain Object that contains the business logic
# The repository is expected to return this domain object or
# collection of domain objects
module Blorgh
  class User < Struct.new(:id, :name, :active)
    # business logic goes here
    def foo(n, m)
      case n
      when 0
        case m  # Noncompliant; nested case
        when 0 then puts "0"
          # ...
        end
      when 1 then puts "1"
      else puts "2"
      end
    end
  end
end
