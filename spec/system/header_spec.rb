require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject {page}
      it 'サイト名が表示される' do
        is_expected.to have_content 'wemory'
      end
      it 'お問い合わせリンクが表示される' do
        expect(page).to have_link 'お問い合わせ'
      end
      it '会員登録リンクが表示される' do
        expect(page).to have_link '会員登録'
      end
      it 'ログインリンクが表示される' do
        expect(page).to have_link 'ログイン'
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'About画面に遷移する' do
        click_link 'wemory'
        is_expected.to eq(about_path)
      end
      it 'お問い合わせ画面に遷移する' do
        within '.nav-items' do
          click_link 'お問い合わせ'
        end
        is_expected.to eq(contacts_contact_path)
      end
      it '会員登録画面に遷移する' do
        within '.nav-items' do
          click_link '会員登録'
        end
        is_expected.to eq(new_user_registration_path)
      end
      it 'ログイン画面に遷移する' do
        within '.nav-items' do
          click_link 'ログイン'
        end
        is_expected.to eq(new_user_session_path)
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
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'サイト名が表示される' do
        is_expected.to have_content 'wemory'
      end
      it '投稿一覧リンクが表示される' do
        expect(page).to have_link '投稿一覧'
      end
      it '投稿リンクが表示される' do
        expect(page).to have_link '投稿'
      end
      it 'カテゴリーリンクが表示される' do
        expect(page).to have_link 'カテゴリー'
      end
      it '配送先設定リンクが表示される' do
        expect(page).to have_link '配送先設定'
      end
      it '承認リンクが表示される' do
        expect(page).to have_link '承認'
      end
      it 'カートリンクが表示される' do
        expect(page).to have_link 'カート'
      end
      it '注文履歴リンクが表示される' do
        expect(page).to have_link '注文履歴'
      end
      it 'ログアウトリンクが表示される' do
        expect(page).to have_link 'ログアウト'
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'About画面に遷移する' do
        click_link 'wemory'
        is_expected.to eq(top_path)
      end
      it '投稿一覧画面に遷移する' do
        within '.nav-items' do
          click_link '投稿一覧'
        end
        is_expected.to eq(post_images_path)
      end
      it '新規投稿画面に遷移する' do
        within '.nav-items' do
          click_link '投稿'
        end
        is_expected.to eq(new_post_image_path)
      end
      it 'カテゴリー画面に遷移する' do
        within '.nav-items' do
          click_link 'カテゴリー'
        end
        is_expected.to eq(new_category_path)
      end
      it '配送先設定画面に遷移する' do
        within '.nav-items' do
          click_link '配送先設定'
        end
        is_expected.to eq(new_shipping_path)
      end
      it '承認画面に遷移する' do
        within '.nav-items' do
          click_link '承認'
        end
        is_expected.to eq(approvals_search_path)
      end
      it 'カート画面に遷移する' do
        within '.nav-items' do
          click_link 'カート'
        end
        is_expected.to eq(cart_images_index_path)
      end
      it '注文履歴一覧画面に遷移する' do
        within '.nav-items' do
          click_link '注文履歴'
        end
        is_expected.to eq(orders_path)
      end
      it 'ログアウト画面に遷移する' do
        within '.nav-items' do
          click_link 'ログアウト'
        end
        is_expected.to eq(root_path)
      end
    end
  end
end