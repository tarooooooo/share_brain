# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Unblock::CompleteWorkflow, type: :workflow do
  subject { described_class }
  let(:user) { create(:user) }
  let(:block_user_information) { create(:block_user_information, user: user)}

  describe 'run!' do
    subject { described_class.run!(block_user_information: block_user_information) }

    before do
      allow(block_user_information).to receive(:unblock!)
    end

    it 'block_user_information.unblock!が1回呼ばれる' do
      subject
      expect(block_user_information).to have_received(:unblock!).once
    end
  end
end
