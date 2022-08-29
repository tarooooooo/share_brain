require 'rails_helper'

RSpec.describe PaidArticleNotification, type: :model do

  describe ".published" do
    subject{ described_class.published }
    before do
      travel_to(Time.new(2021, 3, 22, 7, 53, 0))
    end
    context "published_at is before the current time" do
      let(:paid_article_notification) { create(:paid_article_notification, published_at: Time.current + 1.second)}
      it {is_expected.not_to match_array([paid_article_notification]) }
    end

    context "published_at is after the current time" do
      let(:paid_article_notification) { create(:paid_article_notification, published_at: Time.current - 1.second)}
      it {is_expected.to match_array([paid_article_notification]) }
    end

    context "published_at equals the current time" do
      let(:paid_article_notification) { create(:paid_article_notification, published_at: Time.current)}
      it {is_expected.to match_array([paid_article_notification]) }
    end
  end

  describe ".pre_publication" do
    subject{ described_class.pre_publication }
    before do
      travel_to(Time.new(2021, 3, 22, 7, 53, 0))
    end
    context "published_at is before the current time" do
      let(:paid_article_notification) { create(:paid_article_notification, published_at: Time.current + 1.second)}
      it {is_expected.to match_array([paid_article_notification]) }
    end

    context "published_at is after the current time" do
      let(:paid_article_notification) { create(:paid_article_notification, published_at: Time.current - 1.second)}
      it {is_expected.not_to match_array([paid_article_notification]) }
    end

    context "published_at equals the current time" do
      let(:paid_article_notification) { create(:paid_article_notification, published_at: Time.current)}
      it {is_expected.not_to match_array([paid_article_notification]) }
    end
  end
end
