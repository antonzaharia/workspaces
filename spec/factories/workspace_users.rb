FactoryBot.define do
  factory :workspace_user do
    email { 'test@test.com' }

    association :workspace, factory: :workspace
    association :user, factory: :user
  end
end
