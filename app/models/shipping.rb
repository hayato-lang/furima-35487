class Shipping < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 0}
    validates :municipality
    validates :address
    validates :phone_number
  end
end
