class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  validates_presence_of :name
end
