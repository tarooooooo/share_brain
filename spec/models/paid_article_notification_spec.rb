require 'rails_helper'

RSpec.describe PaidArticleNotification, type: :model do

  describe ".published" do
    subject{ described_class.published }
    before do
      travel_to(Time.new(2021, 3, 22, 7, 53, 0))
    end
    context "publication date is before the current time" do
      let(:pre_publication_paid_article_notification) { create(:paid_article_notification, published_at: Time.current + 1.second)}
      it {is_expected.not_to match_array([pre_publication_paid_article_notification]) }
    end

    context "publication date is after the current time" do
      let(:published_paid_article_notification) { create(:paid_article_notification, published_at: Time.current - 1.second)}
      it {is_expected.to match_array([published_paid_article_notification]) }
    end
  end

  describe ".pre_publication" do
    subject{ described_class.pre_publication }
    before do
      travel_to(Time.new(2021, 3, 22, 7, 53, 0))
    end
    context "publication date is after the current time" do
      let(:published_paid_article_notification) { create(:paid_article_notification, published_at: Time.current - 1.second)}
      it {is_expected.not_to match_array([published_paid_article_notification]) }
    end

    context "publication date is before the current time" do
      let(:pre_publication_paid_article_notification) { create(:paid_article_notification, published_at: Time.current + 1.second)}
      it {is_expected.to match_array([pre_publication_paid_article_notification]) }
    end
  end
end
