FactoryBot.define do
  factory :task do
    title { 'test_title' }
    details { 'test_details' }
    expired_at { '2020-10-06-15:00' }
  end
  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル２' }
    details { 'Factoryで作ったデフォルトのディテール２' }
    expired_at { '2021-01-20-19:00' }
  end
end