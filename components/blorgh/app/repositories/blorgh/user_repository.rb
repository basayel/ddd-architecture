module Blorgh
  class UserRepository
    include AppBase::BaseRepository

    class << self
      def external_class
        Blorgh.user_class
      end

      def adapter
        Blorgh::UserAdapter.new
      end

      # User Chained Scopes

      # Assuming defined scope in <root>/app/models/user.rb
      # scope :active, -> { where(state: 'active') }
      # So you will use it by calling Blorgh::User.active.all
      def active
        add_chained_method :active
      end
    end

    # Instance Methods
    # Associations
  end
end
