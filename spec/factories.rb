FactoryBot.define do
  factory :list do
    product { nil }
    cart { nil }
    quantity { 1 }
  end

  factory :cart do
    user { nil }
  end

  factory :product do
    name { "MyString" }
    price { 1.5 }
    status { 1 }
    quantity { 1 }
    user { nil }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end