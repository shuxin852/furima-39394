class OrderForm
  include ActiveModel::Model 
  
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Phone number should be 10-11 digits" }
  end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}


  def save
    if valid?
      address = Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number)
    end
  end
  end