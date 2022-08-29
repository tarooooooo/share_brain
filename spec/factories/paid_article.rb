FactoryBot.define do
  factory :paid_article do
    title { "title" }
    body { "body" }
    association :seller, factory: :user
    price { 200 }
    published_at { Time.current }
  end
end
