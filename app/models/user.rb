class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :vehicles
end
