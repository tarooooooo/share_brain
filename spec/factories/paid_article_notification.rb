FactoryBot.define do
  factory :paid_article_notification do
    title { "title" }
    body { "body" }
    association :writer, factory: :user
    association :paid_article, factory: :paid_article
    published_at { Time.current }
  end
end
