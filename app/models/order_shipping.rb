class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :user_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipality
    validates :address
    validates :phone_number
  end
  validates :prefecture_id, numericality: {other_than: 0}
end