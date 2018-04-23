class XemTestForm
  include ActiveModel::Model
  attr_accessor :xem_address
  validates :xem_address, presence: true
end



