class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  validates :ref_id, uniqueness: true
end
