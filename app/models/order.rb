class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :ordered_items
  has_many :items, through: :ordered_items

  attr_accessor :item_to_be_added

  def dish_name

  end
end
