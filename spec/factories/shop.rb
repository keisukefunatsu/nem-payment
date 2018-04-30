FactoryGirl.define do
  factory :shop do
    email "funatsuman@example.com"
    password "1234567"
    confirmed_at 1.day.ago

    after(:build) do |shop|
      shop.shop_profile ||= FactoryGirl.build(:shop_profile, shop: shop)
    end
  end

  factory :shop_without_profile, class: Shop do |shop|
    shop.email "funatsuman2@example.com"
    shop.password "1234567"
    shop.confirmed_at 1.day.ago
  end
end