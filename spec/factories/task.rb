FactoryBot.define do
  factory :task do
    title { 'test_title' }
    details { 'test_details' }
    expired_at { '2021-03-02　14:18' }
    priority {'高'}
    status { '未着手' }
    # association :user
  end
  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル２' }
    details { 'Factoryで作ったデフォルトのディテール２' }
    expired_at { '2022-04-29　16:28' }
    priority {'低'}
    status { '未着手' }
    # association :user
  end
end