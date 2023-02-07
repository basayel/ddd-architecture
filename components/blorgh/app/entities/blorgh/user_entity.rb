module Blorgh
  class UserEntity < AppBase::ApplicationEntity
    delegate_attrs :id,
      :name,
      :active
  end
end
