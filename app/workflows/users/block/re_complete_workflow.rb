module Users
  module Block
    class ReCompleteWorkflow < ::ActiveInteraction::Base
      record :block_user_information

      def execute
        ActiveRecord::Base.transaction do
          block_user_information.block!
        end
      end
    end
  end
end
