class Deal
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search

  search_in :address1, :address2, :landmark, :city, :state, :country, :zip

  VEHICLE_DATA = {:vehicle_type => ['Sports bike', 'Scooter', 'Moped', 'Touring bike'],
    :make => ['Bajaj', 'Hero', 'Honda', 'Mahindra', 'TVS', 'Yamaha'],
    :model => {'Bajaj' => ['Discover', 'Platina', 'Pulsar', 'M 80'],
      'Hero' => ['Splendor', 'Karizma', 'Impulse', 'Hunk', 'Xtreme','Mestro'],
      'Honda' => ['Activa', 'Aviator','Unicorn', 'Stunner', 'Twister'],
      'Mahindra' => ['Centuro', 'Duro', 'Rodeo', 'Pantero'],
      'TVS' => ['Jupiter', 'Vector', 'Wego','Scooty', 'Star'],
      'Yamaha' => ['Ray','FZ', 'YBR', 'SZ']
  }
  }

  scope :latest, lambda { where(:from.lte => Date.today, :till.gte => Date.today) }

  field :title, type: String
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

  validates :vehicle_type, :from, :till, :city, :mobile, :user_id, presence: true
  validate :date_validation

  def date_validation
    if till.present? && from.present?
      if till.to_date < from.to_date
        errors.add(:till, "can't be less than from date")
      end

      if from.to_date > till.to_date
        errors.add(:from, "can't be greater than till date")
      end
    end
    if registration_date.present? && registration_date.to_date > Date.today
      errors.add(:registration_date, "can't be greater than today's date")
    end
  end

  def location
    [address1, address2, city, country].compact.join(' ')
  end

  def bike_detail
    [vehicle_type, make, model].compact.join(' ')
  end
end
