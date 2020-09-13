require 'rails_helper'

RSpec.describe PostImage, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }
    subject { post_image.valid? }
    context 'user_idカラム' do
      it '空欄でないこと' do
        post_image.user_id = ""
        is_expected.to eq false
      end
    end

    context 'image_idカラム' do
      it '空欄でないこと' do
        post_image.image_id = ""
        is_expected.to eq false
      end
    end

    context 'introductionカラム(30文字テスト)' do
      it '30文字以下であること' do
        post_image.introduction = Faker::Lorem.characters(number:30)
        is_expected.to eq true
      end
    end

    context 'introductionカラム(31文字テスト)' do
      it '30文字以下であること' do
        post_image.introduction = Faker::Lorem.characters(number:31)
        is_expected.to eq false
      end
    end
  end
end
