require 'rails_helper'

RSpec.describe 'セッション機能', type: :system do
  before do
    @user = FactoryBot.create(:admin_user)
    visit new_session_path
    fill_in 'sessions__new__form--email', with: FactoryBot.build(:admin_user).email
    fill_in 'sessions__new__form--password', with: FactoryBot.build(:admin_user).password
    click_on 'sessions__new__form--submit'
  end
  describe '管理画面のテスト' do
    context '管理ユーザが管理画面にアクセスした場合' do
      it '登録済みユーザ一覧画面が表示される' do
        visit admin_users_path
        expect(
          !!find_by_id("admin-users__index__title")
        ).to be_equal true
      end
    end
    context '管理者がユーザの新規登録をした場合' do
      it 'ユーザが登録される' do
        visit new_admin_user_path
        fill_in 'Name', with: 'new_user'
        fill_in 'Email', with: 'new_user@example.com'
        fill_in 'Password', with: 'new_user@example.com'
        fill_in 'Password confirmation', with:'new_user@example.com'
        click_on 'Create my account'
        expect(page).to have_content 'new_user'
      end
    end
  end
  context '管理者がユーザの詳細画面にアクセスした場合' do
    it '詳細画面に遷移する' do
      visit admin_user_path(@user.id)
      expect(page).to have_content 'ユーザ詳細画面'
    end
  end
  context '管理者がユーザを編集した場合' do
    it 'ユーザ情報が変更される' do
      visit edit_admin_user_path(@user.id)
        fill_in 'Name', with: 'change_user'
        fill_in 'Email', with: 'change_user@example.com'
        fill_in 'Password', with: 'change_user@example.com'
        fill_in 'Password confirmation', with:'change_user@example.com'
        click_on 'Update account'
      expect(page).to have_content 'change_user'
    end
  end
  context '管理者がユーザを削除した場合' do
    it 'ユーザが削除される' do
      @admin2 = FactoryBot.create(:admin_user2)
      visit admin_users_path
      click_on 'ユーザを削除する', match: :first
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'ユーザを削除しました'
    end
  end
end

# find_by_id("admin-users__index__title") => nil, Cabybara<>
# !!nil => false
# !!Cabybara<> => true