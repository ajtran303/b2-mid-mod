kara = Mechanic.create!(name: "Kara Tran", years_of_experience: 11)

hershey_park = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

frog_hopper = hershey_park.rides.create!(name: "The Frog Hopper", thrill_rating: 10)
fahrenheit = hershey_park.rides.create!(name: "Fahrenheit", thrill_rating: 5)
kiss_raise = hershey_park.rides.create!(name: "The Kiss Raise", thrill_rating: 8)

great_bear = hershey_park.rides.create!(name: "The Great Bear", thrill_rating: 10)
