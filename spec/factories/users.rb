FactoryBot.define do
  factory :task_user, class: User do
    name { "task_user" }
    email { "task_user@example.com" }
    password { "task_user@example.com" }
    password_confirmation {"task_user@example.com"}
  end
  factory :task_user2, class: User do
    name { "abcde2" }
    email { "abcde2@example.com" }
    password { "abcde2@example.com" }
    password_confirmation {"abcde2@example.com"}
  end
  factory :user do
    name { "abcd" }
    email { "abcd@example.com" }
    password { "abcd@example.com" }
    password_confirmation {"abcd@example.com"}
  end
  factory :other_user1, class: User do
    name { "abcd1" }
    email { "abcd1@example.com" }
    password { "abcd1@example.com" }
    password_confirmation {"abcd1@example.com"}
  end
  factory :admin_user, class: User do
    name { 'admin'}
    email { 'admin@example.com'}
    password { 'admin@example.com'}
    password_confirmation {'admin@example.com'}
    admin { :true }
  end
  factory :admin_user2, class: User do
    name { 'admin2'}
    email { 'admin2@example.com'}
    password { 'admin2@example.com'}
    password_confirmation {'admin2@example.com'}
    admin { :true }
  end
end
