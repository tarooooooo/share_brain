FactoryBot.define do
  factory :paid_article_notification do
    title { "title" }
    body { "body" }
    writer { create(:user) }
    paid_article { create(:paid_article) }
    published_at { Time.current }
  end
end
