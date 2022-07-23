# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Block::ReCompleteWorkflow, type: :workflow do
  subject { described_class }
  let(:user) { create(:user) }
  let(:unblock_user_information) { create(:block_user_information, status: 'unblocked', user: user)}

  describe 'run!' do
    subject { described_class.run!(block_user_information: unblock_user_information) }

    before do
      allow(unblock_user_information).to receive(:block!)
    end

    it 'unblock_user_information.block!が1回呼ばれる' do
      subject
      expect(unblock_user_information).to have_received(:block!).once
    end
  end
end
