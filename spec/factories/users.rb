FactoryBot.define do
  factory :user do
    name { "abcd" }
    email { "abcd@example.com" }
    password { "abcd@example.com" }
    password_confirmation {"abcd@example.com"}
  end
  factory :admin_user, class: User do
    name { 'admin'}
    email { 'admin@example.com'}
    password { 'admin@example.com'}
    password_confirmation {'admin@example.com'}
    admin { :true }
  end
end
