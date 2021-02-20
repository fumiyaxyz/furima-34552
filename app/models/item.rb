class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates  :name
    validates  :description
    validates  :price,  numericality: { only_integer: true,
      greater_than: 299, less_than: 10000000
    }
    with_options numericality: { other_than: 1}
      validates  :category_id
      validates  :status_id
      validates  :delivery_fee_id
      validates  :prefecture_id
      validates  :ship_days_id
     end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :ship_days

end
