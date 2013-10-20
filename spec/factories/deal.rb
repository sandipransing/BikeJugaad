FactoryGirl.define do
  factory :deal do |v|
    v.vehicle_type 'Scooter'
    v.from Time.now
    v.till Time.now + 2.day
    v.make 'Honda'
    v.model 'Activa'
    v.address1 'shivajinager'
    v.address2 'thube park'
    v.land_mark 'near sanchety'
    v.city 'pune'
    v.state 'maharashtra'
    v.country 'india'
    v.zip '411005'
    v.rate_per_hour '12'
    v.rate_per_day '175'
    v.phone '25678789'
    v.mobile '9898976899'
  end
end
