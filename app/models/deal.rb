class Deal
  include Mongoid::Document
  include Mongoid::Timestamps

  field :vehicle_type, type: String 
  
  field :from, type: DateTime
  field :till, type: DateTime
  
  field :make, type: String
  field :model, type: String
  field :registration_date, type: Date

  field :mobile, type: String
  field :phone, type: String
  field :email, type: String
  
  field :address1, type: String
  field :address2, type: String
  field :land_mark, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :zip, type: String
  
  field :info, type: String
  
  field :rate_per_hour, type: String
  field :rate_per_day, type: String
  
  mount_uploader :photo, PhotoUploader
  

  belongs_to :user

  embeds_many :images, :cascade_callbacks => true

  #validates_inlusion_of :vehicle_type, :in => Sports bike, Scooter, Moped, Touring bike
  validates :vehicle_type, :from, :till, :user_id, presence: true

  accepts_nested_attributes_for :images

  def location
     [address1, address2, city, country].compact.join(' ')
  end

end
