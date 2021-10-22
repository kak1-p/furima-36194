class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :city
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :items_name
    validates :detail
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :city_id
    validates :delivery_date_id
    validates :price
  end
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :city_id
    validates :delivery_date_id
  end
  validates :price, numericality: { in: 300..9999999 }
  validates_inclusion_of :price, in:300..9999999
end
