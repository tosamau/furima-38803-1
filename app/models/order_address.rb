class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :post_code, :ship_from_id, :city_name, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)"} 
    validates :city_name
    validates :house_number
    validates :phone_number,format: { with: /\A[0-9]{10,11}\z/, message: "is invalid" }
  end
    validates :ship_from_id, numericality: { other_than: 1 , message: "can't be blank" } #都道府県

    def save
      #item = Item.find(item_id)
      #user = User.find(user_id)
      #order = Order.create(item: item, user: user)
      order = Order.create(item_id: item_id, user_id: user_id)
      Address.create(post_code: post_code, ship_from_id: ship_from_id, city_name: city_name, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end
