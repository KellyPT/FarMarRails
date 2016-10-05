class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  validates :ref_id, uniqueness: true

  def self.products
    products
  end
end
