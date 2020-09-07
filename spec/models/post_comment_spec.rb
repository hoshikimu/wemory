require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe 'バリデーションテスト' do
    let(:user) { create(:user)}
    let(:post_image) { create(:post_image, user_id: user.id ) }
    let!(:post_comment) { build(:post_comment, user_id: user.id, post_image_id: post_image.id) }
    subject { post_comment.valid? }
    context 'commentカラム' do
      it '空欄でないこと' do
        post_comment.comment = ""
        is_expected.to eq false
      end
      it '100文字以上でないこと(100文字テスト)' do
        post_comment.comment = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
      end
      it '100文字以上でないこと(101文字テスト)' do
        post_comment.comment = Faker::Lorem.characters(number: 101)
        is_expected.to eq false
      end
    end
  end
end
