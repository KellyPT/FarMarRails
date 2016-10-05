class Market < ActiveRecord::Base
  has_many :vendors

  validates :ref_id, uniqueness: true

  def all_vendors
    self.vendors
  end
end
