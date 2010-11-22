Factory.define :property do |p|
  p.street_name Faker::Name.first_name
  p.street_type "St"
  p.suburb "West Footscray"
  p.state "Vic"
  p.postcode "3121"
end

Factory.define :listing do |l|
  l.price 200
  l.association :property, :factory => :property
end
