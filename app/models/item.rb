class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :image, presence: true
  validates :title, presence: true
  validates :describe, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_day
  belongs_to :shipping_cost
  belongs_to :prefecture

  def sold_out?
    order.present?
  end
end
