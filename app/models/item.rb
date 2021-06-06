class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :brand
  belongs_to :day

  has_one :order
  has_one_attached :image

  with_options presence: true do
   validates :image
   validates :name
   validates :description
   validates :category_id,                           numericality: { other_than: 1 } 
   validates :status_id,                             numericality: { other_than: 1 } 
   validates :cost_id,                               numericality: { other_than: 1 } 
   validates :brand_id,                              numericality: { other_than: 1 } 
   validates :day_id,                                numericality: { other_than: 1 } 
   validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
