module Blorgh
  class UserAdapter
    def convert(external_user)
      if external_user.present?
        attrs = mapping_from external_user
        User.new(*attrs.values)
      else
        User.new
      end
    end

    def mapping_from(external_user)
      {
        id: external_user.id,
        name: external_user.name,
        active: external_user.active
      }
    end
  end
end
