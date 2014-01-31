FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "Fran#{n}"}
    password_digest
    email {"#{name}@example.com"}
  end
end
