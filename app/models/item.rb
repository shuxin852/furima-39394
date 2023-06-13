class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :describe, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true

  extend ActiveHash::Associations::AcitiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_day
  belongs_to :shipping_cost
  belongs_to :prefecture
end

