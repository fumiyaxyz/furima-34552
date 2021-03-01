class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one    :order
  has_one_attached :image
  has_many :favorites

  with_options presence: true do
    validates  :name
    validates  :image
    validates  :description
    validates  :price, numericality: { only_integer: true,
                                       greater_than: 299, less_than: 10_000_000 }
    with_options numericality: { other_than: 1 } do
      validates  :category_id
      validates  :status_id
      validates  :delivery_fee_id
      validates  :prefecture_id
      validates  :ship_days_id
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end 

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_days
end
