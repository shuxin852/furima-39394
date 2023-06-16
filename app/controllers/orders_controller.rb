class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
  end
end
