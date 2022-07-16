# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Block::CompleteWorkflow, type: :workflow do
  subject { described_class }
  let(:user) { create(:user) }

  describe 'run!' do
    subject do
      described_class.run!(
      user: user
      )
    end

    it 'BlockUserInformationレコードが一件増える' do
      expect do
        subject
      end.to change(BlockUserInformation, :count).by(1)
    end
  end
end
