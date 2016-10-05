class Market < ActiveRecord::Base
  has_many :vendors

  validates :ref_id, uniqueness: true
end
