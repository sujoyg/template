FactoryGirl.define do
  factory :account do
    email { random_email }
    password { random_text }
  end
end
