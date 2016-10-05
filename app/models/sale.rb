class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates :ref_id, uniqueness: true
end
