require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'バリデーションテスト' do
    let(:user) { create(:user) }
    let!(:order) { build(:order, user_id:user.id) }
    subject { order.valid? }
    context 'postal_codeカラム' do
      it '空欄でないこと' do
        order.postal_code = ''
        is_expected.to eq false
      end
      it '7桁であること(6桁テスト)' do
        order.postal_code = Faker::Number.number(digits:6)
        is_expected.to eq false
      end
      it '7桁であること(8桁テスト)' do
        order.postal_code = Faker::Number.number(digits:8)
        is_expected.to eq false
      end
      it '7桁であること(7桁テスト)' do
        order.postal_code = Faker::Number.number(digits:7)
        is_expected.to eq true
      end
    end

    context 'prefecture_codeカラム' do
      it '空欄でないこと' do
        order.prefecture_code = ''
        is_expected.to eq false
      end
    end

    context 'address_cityカラム' do
      it '空欄でないこと' do
        order.address_city = ''
        is_expected.to eq false
      end
    end

    context 'address_streetカラム' do
      it '空欄でないこと' do
        order.address_street = ''
        is_expected.to eq false
      end
    end

    context 'receiverカラム' do
      it '空欄でないこと' do
        order.receiver = ''
        is_expected.to eq false
      end
    end

    context 'phone_numberカラム' do
      it '空欄でないこと' do
        order.phone_number = ''
        is_expected.to eq false
      end
      it '10桁or11桁であること(10桁テスト)' do
        order.phone_number = Faker::Number.number(digits:10)
        is_expected.to eq true
      end
      it '10桁or11桁であること(11桁テスト)' do
        order.phone_number = Faker::Number.number(digits:11)
        is_expected.to eq true
      end
      it '10桁or11桁であること(9桁テスト)' do
        order.phone_number = Faker::Number.number(digits:9)
        is_expected.to eq false
      end
      it '10桁or11桁であること(12桁テスト)' do
        order.phone_number = Faker::Number.number(digits:12)
        is_expected.to eq false
      end
    end
  end
end
