class City
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :country
  
  field :name, type: String
  
  validates :name, :presence => true

  def as_json(options={})
    super(:only => [:_id, :name, :country_id])
  end
end
