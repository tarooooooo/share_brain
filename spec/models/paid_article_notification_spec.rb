require 'rails_helper'

RSpec.describe PaidArticleNotification, type: :model do
  describe ".published" do
    subject{ described_class.published }

    let(:current_time) { Time.zone.local(2022, 8, 25, 12, 0, 0) }
    context "publication date is before the current time" do
      let(:pre_publication_paid_article_notification) { create(:paid_article_notification, published_at: current_time + 1.second)}
      it { is_expected.to match_array([pre_publication_paid_article_notification])  }
    end
  end
end
