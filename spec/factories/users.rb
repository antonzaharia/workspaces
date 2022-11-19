FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { 'password!' }
    name { 'Anton' }
    dob { Date.new(1995,1,1) }
  end
end
