FactoryGirl.define do
  factory :vehicle do |v|
    v.vehicle_type 'Scooter'
    v.from_date Time.now
    v.to_date Time.now + 2.day
    v.make 'Honda'
    v.model 'Activa'
    v.address1 'shivajinager'
    v.address2 'thube park'
    v.land_mark 'near sanchety'
    v.city 'pune'
    v.state 'maharashtra'
    v.country 'india'
    v.zip_code '411005'
    v.rate_per_hour '12 Rs'
    v.rate_per_day '175 Rs'
    v.land_line '25678789'
    v.mobile1 '9898976899'
    v.mobile2 '9876543278'
  end
end
