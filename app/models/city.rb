class City
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :country
  
  field :name, type: String
  
  validates :name, :presence => true
end
