class Deal
  include Mongoid::Document
  include Mongoid::Timestamps

  VEHICLE_DATA = {:vehicle_type => ['Sports bike', 'Scooter', 'Moped', 'Touring bike'], 
                  :make => ['Bajaj', 'Hero', 'Honda', 'Mahindra', 'TVS', 'Yamaha'], 
                  :model => {'Bajaj' => ['Disacover', 'Platina', 'Pulsar', 'M 80'],
                             'Hero' => ['Splender', 'Karizma', 'Impuls', 'Hunk', 'Xtream','Mestro'],
                             'Honda' => ['Activa', 'Aviator','Unicon', 'Stunner', 'Twister'],
                             'Mahindra' => ['Centuro', 'Duero', 'Rodeo', 'Pantero'],
                             'TVS' => ['Jupitor', 'Vector', 'Wego','Scooty', 'Star'],
                             'Yamaha' => ['Ray','FZ', 'YBR', 'SZ']
                            }
                 }

  field :vehicle_type, type: String 
  
  field :from, type: Date
  field :till, type: Date
  
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

  validates :vehicle_type, :from, :till, :user_id, presence: true
  validate :date_validation

  accepts_nested_attributes_for :images

  def date_validation
    if till < from
      errors.add(:till, "can't be less than from date")
    end
   
    if from > till
      errors.add(:from, "can't be greter than till date")
    end
    
    if registration_date.present? && registration_date > Date.today
      errors.add(:registration_date, "can't be greter than tody's date")
    end
  end

  def location
     [address1, address2, city, country].compact.join(' ')
  end

end
