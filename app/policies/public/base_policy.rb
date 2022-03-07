module Public
  class BasePolicy
    attr_reader :user, :record

    def initialize (user, record)
      @user = user
      @record = record
    end
  end
end
