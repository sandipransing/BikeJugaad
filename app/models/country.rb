class Country
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :cities

  field :name, type: String
  field :code, type: String

  validates :code, :presence => true
end
