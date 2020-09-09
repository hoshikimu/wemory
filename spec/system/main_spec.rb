require 'rails_helper'

describe 'ユーザー権限のテスト' do
  let!(:user) { create(:user) }
  let!(:post_image) { create(:post_image, user_id: user.id) }
  let!(:category) { create(:category, user_id: user.id) }
  let!(:shipping) { create(:shipping, user_id: user.id) }
  let!(:order) { create(:order, user_id: user.id) }
  describe 'ログインしていない場合' do
    context 'ログインユーザーのみ訪問可能なURLにアクセス' do
      it 'Top画面に遷移できない' do
        visit top_path
        expect(current_path).to eq(new_user_session_path)
      end
      it '投稿一覧画面に遷移できない' do
        visit post_images_path
        expect(current_path).to eq(new_user_session_path)
      end
      it '投稿詳細画面に遷移できない' do
        visit post_image_path(user)
        expect(current_path).to eq(new_user_session_path)
      end
      it '新規投稿画面に遷移できない' do
        visit new_post_image_path
        expect(current_path).to eq(new_user_session_path)
      end
      it 'カテゴリー画面に遷移できない' do
        visit new_category_path
        expect(current_path).to eq(new_user_session_path)
      end
      it 'カテゴリー編集画面に遷移できない' do
        visit edit_category_path(category)
        expect(current_path).to eq(new_user_session_path)
      end
      it '配送先設定画面に遷移できない' do
        visit new_shipping_path
        expect(current_path).to eq(new_user_session_path)
      end
      it '配送先編集画面に遷移できない' do
        visit edit_shipping_path(shipping)
        expect(current_path).to eq(new_user_session_path)
      end
      it '承認画面に遷移できない' do
        visit approvals_search_path
        expect(current_path).to eq(new_user_session_path)
      end
      it 'カート画面に遷移できない' do
        visit cart_images_index_path
        expect(current_path).to eq(new_user_session_path)
      end
      it '注文履歴一覧画面に遷移できない' do
        visit orders_path
        expect(current_path).to eq(new_user_session_path)
      end
      it '注文履歴詳細画面に遷移できない' do
        visit order_path(order)
        expect(current_path).to eq(new_user_session_path)
      end
      it '注文情報入力画面に遷移できない' do
        visit new_order_path
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end

  describe 'ログインしている場合' do
    let!(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    context 'ログインユーザーが訪問不可能なURLへアクセス' do
      it 'About画面に遷移できない' do
        visit root_path
        expect(current_path).to eq(top_path)
        expect(page).to have_content 'ログイン中です'
      end
      it '会員登録画面に遷移できない' do
        visit new_user_registration_path
        expect(current_path).to eq(top_path)
        expect(page).to have_content 'You are already signed in.'
      end
      it 'ログイン画面に遷移できない' do
        visit new_user_session_path
        expect(current_path).to eq(top_path)
        expect(page).to have_content 'You are already signed in.'
      end
    end
  end
end