FactoryGirl.define do
  factory :user do |u|
    u.email 'kiran@joshsoftware.com'
    u.password 'Josh123#'
  end

  factory :user_with_deals, parent: :user do
    after(:create) do |user|
      user.deals << FactoryGirl.build(:deal)
    end
  end
end
