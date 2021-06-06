class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :description
   validates :category_id
   validates :status_id
   validates :cost_id
   validates :brand_id
   validates :day_id
   validates :price
  end
end
