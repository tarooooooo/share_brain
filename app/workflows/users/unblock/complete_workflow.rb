module Users
  module Unblock
    class CompleteWorkflow < ::ActiveInteraction::Base
      record :block_user_information

      def execute
        ActiveRecord::Base.transaction do
          block_user_information.unblock!
        end
      end
    end
  end
end
