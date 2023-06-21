class OrderForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた半角文字列で入力してください' }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
    validates :token
    validates :item_id
    validates :user_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities,
                             address: self.address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
