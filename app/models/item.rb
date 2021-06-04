class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  # validates :name,           presence: true
  # validates :description,    presence: true
  # validates :category_id,    presence: true
  # validates :status_id,      presence: true
  # validates :cost_id,        presence: true
  # validates :brand_id,       presence: true
  # validates :day_id,         presence: true
  # validates :price,          presence: true
end
