require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it "すべて入力できていれば購入できる" do
        expect(@order_address).to be_valid
      end

      it "建物名がブランクでも購入できる" do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end


  context '内容に問題がある場合' do
    it "tokenが空では保存ができない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号がブランクでは保存ができない" do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end

    it "郵便番号にハイフンがないと保存ができない" do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "郵便番号の桁数が少ないと保存ができない" do
      @order_address.post_code = '111-111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "郵便番号の半角文字列以外保存できない" do
      @order_address.post_code = '１１１−１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it '都道府県が空では出品できない' do
      @order_address.ship_from_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Ship from can't be blank")
    end
      
    it '市区町村が空では出品できない' do
      @order_address.city_name = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City name can't be blank")
    end
      
    it '番地が空では出品できない' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空では出品できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が10桁未満では出品できない' do
      @order_address.phone_number = '090123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号が10桁以上11桁以内では出品できない' do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
 end
end
