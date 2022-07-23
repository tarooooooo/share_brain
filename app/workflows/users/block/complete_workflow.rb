module Users
  module Block
    class CompleteWorkflow < ::ActiveInteraction::Base
      record :user

      def execute
        ActiveRecord::Base.transaction do
          user.create_block_user_information
        end
      end
    end
  end
end
