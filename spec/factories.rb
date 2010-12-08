
Factory.define :valid_user, :class => User do |u|
  u.sequence(:login) { Faker::Internet.user_name }
  u.sequence(:email) { Faker::Internet.email }
  u.password "password"
  u.password_confirmation "password"
end

Factory.define :property do |p|
  p.street_name Faker::Address.street_address
  p.street_type Faker::Address.street_suffix
  p.suburb Faker::Address.city
  p.state "Vic"
  p.postcode "3121"
end

Factory.define :listing do |l|
  l.price 200
  l.association :property, :factory => :property
  l.user Factory.create(:valid_user)
end
