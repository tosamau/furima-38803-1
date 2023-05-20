class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :token, :item_id, :user_id, :post_code, :ship_from_id, :city_name, :house_number, :building_name, :phone_number

  with_options presence: true do
    #validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :token, presence: true
    validates :item_id, presence: true
    validates :user_id, presence: true
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :ship_from_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :city_name,presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :house_number,presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :building_name,presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :phone_number,numericality: {only_integer: true, message: "is invalid"}
    validates :order_id,presence: true
  end

    def save
      order = Order.create(item: item_id, user: user_id )
      Address.create(post_code: post_code, ship_from: ship_from_id, city_name: city_name, house_number: house_number, building_name: building_name, phone_number: phone_number, order: order_id)
    end
end
