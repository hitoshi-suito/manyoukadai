FactoryBot.define do
    factory :task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      title { 'test_title' }
      details { 'test_details' }
    end
    factory :second_task, class: Task do
        title { 'Factoryで作ったデフォルトのタイトル２' }
        details { 'Factoryで作ったデフォルトのディテール２' }
    end
  end