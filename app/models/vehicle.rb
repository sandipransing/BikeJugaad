class Vehicle
  include Mongoid::Document
  include Mongoid::Timestamps

  field :vehicle_type, type: String
  field :from_date, type: DateTime
  field :to_date, type: DateTime
  field :info, type: String
  field :make, type: String
  field :model, type: String
  field :address1, type: String
  field :address2, type: String
  field :land_mark, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :zip_code, type: String
  field :rate_per_hour, type: String
  field :rate_per_day, type: String
  field :land_line, type: String
  field :mobile1, type: String
  field :mobile2, type: String

  belongs_to :user

  embeds_many :images, :cascade_callbacks => true

  validates :vehicle_type, :from_date, :to_date, :user_id, presence: true

end
