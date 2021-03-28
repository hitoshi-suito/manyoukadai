FactoryBot.define do
  factory :label do
    name { "Task1" }
  end
end

FactoryBot.define do
  factory :second_label, class: Label do
    name { "Task2"}
  end
end