require 'rails_helper'

RSpec.describe Shipping, type: :model do

  describe 'バリデーションのテスト' do
    let(:shipping) { create(:shipping) }
    subject { shipping.valid? }
    context 'postal_codeカラム' do
      it '空欄でないこと' do
        shipping.postal_code = ''
        is_expected.to eq false
      end
    end
  end
end
