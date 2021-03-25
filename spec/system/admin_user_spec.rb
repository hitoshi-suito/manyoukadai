require 'rails_helper'

RSpec.describe 'セッション機能', type: :system do
  before do
    FactoryBot.create(:admin_user)
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
  end
end

# find_by_id("admin-users__index__title") => nil, Cabybara<>
# !!nil => false
# !!Cabybara<> => true