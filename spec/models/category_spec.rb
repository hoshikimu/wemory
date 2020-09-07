require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーションテスト' do
    let(:user) { create(:user) }
    let(:category) { build(:category, user_id: user.id) }
    subject { category.valid? }
    context 'nameカラム' do
      it '空欄でないこと' do
        category.name = ''
        is_expected.to eq false
      end
      it '10文字以下であること(10文字テスト)' do
        category.name = Faker::Lorem.characters(number:10)
        is_expected.to eq true
      end
      it '10文字以下であること(11文字テスト)' do
        category.name = Faker::Lorem.characters(number:11)
        is_expected.to eq false
      end
    end
  end
end
