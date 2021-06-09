class BuyerOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :brand_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}$|^\d{3}-\d{2}$|^\d{3}\z/ }
    validates :brand_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, brand_id: brand_id, city: city, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
