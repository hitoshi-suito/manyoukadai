require 'rails_helper'

RSpec.describe 'ユーザ登録機能', type: :system do
  describe 'ユーザ新規登録' do
    context 'ユーザ新規登録をした場合' do
      it 'ユーザ詳細画面に項目が表示される' do
        visit new_user_path
        fill_in 'Name', with: 'abcd'
        fill_in 'Email', with: 'abcd@example.com'
        fill_in 'Password', with: 'abcd@example.com'
        fill_in 'Password confirmation', with: 'abcd@example.com'
        click_on 'Create my account'
        expect(page).to have_content 'abc'
        expect(page).to have_content 'abcd@example.com'
      end
    end
  end
  describe '未ログインユーザ遷移機能' do
    context '未ログインユーザがタスク一覧に入ろうとした場合' do
      it 'ログイン画面が表示される' do
        visit tasks_path
        expect(page).to have_content 'Log in'
      end
    end
  end
end

RSpec.describe 'セッション機能', type: :system do
  before do
    FactoryBot.create(:user)
    visit new_session_path
      fill_in 'Email', with: 'abcd@example.com'
      fill_in 'Password', with: 'abcd@example.com'
      click_on 'Log in'
  end
  describe 'ログイン機能' do
    context 'ログイン画面で値を入れた場合' do
      it 'ユーザ詳細画面に遷移する' do
        expect(page).to have_content 'abcd@example.com'
      end
    end
  end
  describe 'ユーザ遷移機能' do
    context 'ユーザが他人のタスク一覧に入ろうとした場合' do
      it 'タスク一覧画面が表示される' do
        visit user_path('1')
        expect(page).to have_content 'タスク一覧'
      end
    end
    context 'ログアウトした場合' do
      it 'ログイン画面に遷移する' do
        visit user_path('1')
        click_on 'Logout'
        expect(page).to have_content 'Log in'
      end
    end
  end
end