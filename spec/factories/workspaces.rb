FactoryBot.define do
  factory :workspace do
    name { 'Company Name' }
    slug { 'company' }

    association :user, factory: :user
  end
end
