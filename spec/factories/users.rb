FactoryGirl.define do
  factory :user do
    email { random_email }
    password { random_text }
  end
end
