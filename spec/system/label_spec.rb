require 'rails_helper'
RSpec.describe 'ラベル登録機能', type: :system do

  def login(user)
    visit new_session_path
    fill_in 'sessions__new__form--email', with: user.email
    fill_in 'sessions__new__form--password', with: user.password
    click_on 'sessions__new__form--submit'
  end

  # before do
  #   user = FactoryBot.create(:task_user)
  #   login(user)
  #   FactoryBot.create(:label)
  #   FactoryBot.create(:second_label)
  #   visit new_task_path
  # end

  describe 'ラベル新規作成機能' do
    context 'ラベルを選択した場合' do
      it 'ラベルが表示される' do
        user = FactoryBot.create(:task_user)
        login(user)
        FactoryBot.create(:label)
        FactoryBot.create(:second_label)
        visit new_task_path
        fill_in 'Title', with: 'aaa'
        fill_in 'Details', with: 'bbb'
        fill_in :task_expired_at, with: '002021-03-17　11:39'
        select '未着手', from: 'status'
        select '中', from: 'priority'
        check 'Task1'       
        click_on 'Create Task'     
        expect(page).to have_content 'aaa'
        expect(page).to have_content 'bbb'
        expect(page).to have_content '2021-03-17　11:39'
        expect(page).to have_content '未着手'
        expect(page).to have_content '中'
        expect(page).to have_content 'Task1'
      end
    end
  end

  describe '詳細確認機能' do
    context '詳細画面に遷移した場合' do
      it 'ラベルが表示される' do
        user = FactoryBot.create(:task_user2)
        login(user)
        label = FactoryBot.create(:label)
        visit new_task_path
        fill_in 'Title', with: 'aaa'
        fill_in 'Details', with: 'bbb'
        fill_in :task_expired_at, with: '002021-03-17　11:39'
        select '未着手', from: 'status'
        select '中', from: 'priority'
        check 'Task1'  
        click_on 'Create Task' 
        click_on '詳細画面'
        expect(page).to have_content 'Task1'
      end
    end
  end

  describe '検索機能' do
    context 'ラベルで検索した場合' do
      it '検索結果が表示される' do
       user = FactoryBot.create(:other_user1)
       login(user)
       label = FactoryBot.create(:second_label)
       visit new_task_path
       fill_in 'Title', with: 'aaa'
       fill_in 'Details', with: 'bbb'
       fill_in :task_expired_at, with: '002021-03-17　11:39'
       select '未着手', from: 'status'
       select '中', from: 'priority'
       check 'Task2'  
       click_on 'Create Task'
       select 'Task2'
       click_on 'search'
       expect(page).to have_content 'Task2'
      end
    end
  end
end