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
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
  end
  context 'ヘッダーの表示を確認' do
    subject { page }
    it 'サイト名が表示される' do
      is_expected.to have_content 'wemory'
    end
  end
end