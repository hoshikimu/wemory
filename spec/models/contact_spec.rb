require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'バリデーションテスト' do
    let(:contact) { build(:contact) }
    subject { contact.valid? }
    context 'emailカラム' do
      it '空欄でないこと' do
        contact.email = ''
        is_expected.to eq false
      end
    end

    context 'messageカラム' do
      it '空欄でないこと' do
        contact.message = ''
        is_expected.to eq false
      end
    end
  end
end
