class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :status

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :status_id
  end
end
