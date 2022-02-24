module Admin
  class BasePolicy
    attr_reader :admin_user, :record

    def initialize(admin_user, record)
      @user = admin_user
      @record = record
    end
  end
end
