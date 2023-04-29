class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :ship_from
  belongs_to :shipping_day 

  belongs_to :user
  has_one_attached :image

  validates :item_name, :string, presence: true
  validates :description, :text, presence: true
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_from_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, :integer, presence: true
end


t.string       :item_name,        null: false 
t.text         :description,      null: false 
t.integer      :category_id,      null: false
t.integer      :condition_id,     null: false 
t.integer      :shipping_fee_id,  null: false
t.integer      :ship_from_id,     null: false
t.integer      :shipping_day_id,  null: false
t.integer      :price,            null: false
t.references   :user,             null:false, foreign_key: true