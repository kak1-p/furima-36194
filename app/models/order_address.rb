class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city_id, :town, :house_number, :building, :tell

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_id
    validates :town
    validates :house_number
    validates :tell, format: {with: ^\d{10-11}$}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code, city_id: city_id, town: town, house_number: house_number, building: building, tell: tell, order_id: order.id
    )
  end
end