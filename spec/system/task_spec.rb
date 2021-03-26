require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  def login(user)
    visit new_session_path
    fill_in 'sessions__new__form--email', with: user.email
    fill_in 'sessions__new__form--password', with: user.password
    click_on 'sessions__new__form--submit'
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        user = FactoryBot.create(:task_user)
        login(user)
        visit new_task_path
        fill_in 'Title', with: 'aaa'
        fill_in 'Details', with: 'bbb'
        fill_in :task_expired_at, with: '002021-03-17　11:39'
        select '未着手', from: 'status'
        select '中', from: 'priority'
        click_on '登録する'       
        expect(page).to have_content 'aaa'
        expect(page).to have_content 'bbb'
        expect(page).to have_content '2021-03-17　11:39'
        expect(page).to have_content '未着手'
        expect(page).to have_content '中'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      second_user = FactoryBot.create(:task_user2)
      login(second_user)
      FactoryBot.create(:task, user: second_user)
      FactoryBot.create(:second_task, user: second_user)
      visit tasks_path 
    end
    context '一覧画面に遷移した場合' do 
      it '作成済みのタスク一覧が表示される' do            
        expect(page).to have_content 'test_title'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル２'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do 
        task_lists = all('.task_expired_at')
        expect(task_lists[0]).to have_content '2022-04-29　16:28'
        expect(task_lists[1]).to have_content '2021-03-02　14:18'
      end
    end
    context 'タスクが優先順位の降順に並んでいる場合' do
      it '優先度の高いタスクが一番上に表示される' do
        click_on '優先度でソートする'
        task_lists = all('.task_priority')
        expect(task_lists[0]).to have_content '高'
        expect(task_lists[1]).to have_content '低'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        admin_user = FactoryBot.create(:admin_user)
        login(admin_user)
        task = FactoryBot.create(:task, user: admin_user)
        visit tasks_path(admin_user.id)
        expect(page).to have_content 'test_title'
       end
     end
  end
  describe '検索機能' do
    context 'タイトルで検索した場合' do
      it '検索結果が表示される' do
        admin_user2 = FactoryBot.create(:admin_user2)
        login(admin_user2)
        FactoryBot.create(:task, user: admin_user2)
        visit tasks_path
        fill_in 'title', with: 'test'
        click_on 'search'
        expect(page).to have_content 'test'
      end
    end
    context 'ステータスで検索した場合' do
      it '検索結果が表示される' do 
        admin_user2 = FactoryBot.create(:admin_user2)
        login(admin_user2)
        FactoryBot.create(:task, user: admin_user2)
        visit tasks_path
        select '未着手', from: 'status'     
        click_on 'search'        
        expect(page).to have_content '未着手'
      end
    end
    context 'タイトルとステータスで検索した場合' do
      it '検索結果が表示される' do
        other_user1 = FactoryBot.create(:other_user1)
        login(other_user1)
        FactoryBot.create(:second_task, user: other_user1)
        visit tasks_path
        fill_in 'title', with: 'Factory'
        select '未着手', from: 'status'
        click_on 'search'
        expect(page).to have_content 'Factory'
        expect(page).to have_content '未着手'
      end
    end
  end
end