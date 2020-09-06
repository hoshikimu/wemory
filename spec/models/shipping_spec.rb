require 'rails_helper'

RSpec.describe Shipping, type: :model do
  describe 'バリデーションのテスト' do
    let(:shipping) { build(:shipping) }
    subject { shipping.valid? }
    context 'postal_codeカラム' do
      it '空欄でないこと' do
        shipping.postal_code = ''
        is_expected.to eq false
      end
      it '7桁であること(6桁テスト)' do
        shipping.postal_code = Faker::Number.number(digits:6)
        is_expected.to eq false
      end
      it '7桁であること(8桁テスト)' do
        shipping.postal_code = Faker::Number.number(digits:8)
        is_expected.to eq false
      end
      it '7桁であること(7桁テスト)' do
        shipping.postal_code = Faker::Number.number(digits:7)
        is_expected.to eq true
      end
    end

    context 'prefecture_codeカラム' do
      it '空欄でないこと' do
        shipping.prefecture_code = ''
        is_expected.to eq false
      end
    end

    context 'address_cityカラム' do
      it '空欄でないこと' do
        shipping.address_city = ''
        is_expected.to eq false
      end
    end

    context 'address_streetカラム' do
      it '空欄でないこと' do
        shipping.address_street = ''
        is_expected.to eq false
      end
    end

    context 'receiverカラム' do
      it '空欄でないこと' do
        shipping.receiver = ''
        is_expected.to eq false
      end
    end

    context 'phone_numberカラム' do
      it '空欄でないこと' do
        shipping.phone_number = ''
        is_expected.to eq false
      end
      it '10桁or11桁であること(10桁テスト)' do
        shipping.phone_number = Faker::Number.number(digits:10)
        is_expected.to eq true
      end
      it '10桁or11桁であること(11桁テスト)' do
        shipping.phone_number = Faker::Number.number(digits:11)
        is_expected.to eq true
      end
      it '10桁or11桁であること(9桁テスト)' do
        shipping.phone_number = Faker::Number.number(digits:9)
        is_expected.to eq false
      end
      it '10桁or11桁であること(12桁テスト)' do
        shipping.phone_number = Faker::Number.number(digits:12)
        is_expected.to eq false
      end
    end
  end
end
