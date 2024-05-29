# db/seeds.rb
require "open-uri"

puts 'Cleaning the database'
Bike.all.each do |bike|
  bike.photo.purge
end

Rental.destroy_all
Bike.destroy_all
User.destroy_all

puts 'Creating 10 users'
users = [
  { first_name: "John", last_name: "Doe", email: "john.doe@example.com", password: "password" },
  { first_name: "Jane", last_name: "Smith", email: "jane.smith@example.com", password: "password" },
  { first_name: "Alice", last_name: "Johnson", email: "alice.johnson@example.com", password: "password" },
  { first_name: "Bob", last_name: "Brown", email: "bob.brown@example.com", password: "password" },
  { first_name: "Charlie", last_name: "Davis", email: "charlie.davis@example.com", password: "password" },
  { first_name: "David", last_name: "Wilson", email: "david.wilson@example.com", password: "password" },
  { first_name: "Eve", last_name: "Clark", email: "eve.clark@example.com", password: "password" },
  { first_name: "Frank", last_name: "Wright", email: "frank.wright@example.com", password: "password" },
  { first_name: "Grace", last_name: "Hall", email: "grace.hall@example.com", password: "password" },
  { first_name: "Hannah", last_name: "Lewis", email: "hannah.lewis@example.com", password: "password" }
]

users.each do |user|
  User.create!(
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: user[:email],
    password: user[:password]
  )
end

puts 'Creating 10 bikes'

# image_1 = URI.open("https://images.unsplash.com/flagged/photo-1576934848835-f72df622a04b?q=80&w=2748&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

bikes = [
  {
    bike_name: "Double Cargo Bike",
    type: "Cargo",
    description: "Discover this Double Cargo Bike, perfect for active families! Transport your groceries or children safely and attach a small bike to the back for tandem adventures.",
    price: 25,
    user_id: User.find_by(email: "john.doe@example.com").id,
    image_url: "https://images.unsplash.com/flagged/photo-1576934848835-f72df622a04b?q=80&w=2748&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

  },
  {
    bike_name: "Yellow Tandem",
    type: "Tandem",
    description: "Check out our Yellow Tandem, ideal for fun rides with a partner! Enjoy the outdoors together with this stylish and comfortable tandem bike.",
    price: 30,
    user_id: User.find_by(email: "jane.smith@example.com").id,
    image_url: "https://images.unsplash.com/photo-1657490018291-0fb17e531de4?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    bike_name: "Cargo Babboe",
    type: "Cargo",
    description: "Experience the Cargo Babboe, your ultimate solution for family transportation! Designed for safety and comfort, it's perfect for carrying children, groceries, and more with ease.",
    price: 35,
    user_id: User.find_by(email: "alice.johnson@example.com").id,
    image_url: "https://www.babboe.fr/media/amasty/blog/cache/1/7/1730/800/1730x800-honden-bakfiets_1-444-354-934.jpg"
  },
  {
    bike_name: "Bicycle Trailer",
    type: "Trailer",
    description: "Enhance your cycling experience with our practical Bicycle Trailer! Ideal for carrying children, pets, or groceries, this trailer offers a safe and convenient way to transport your essentials while enjoying a smooth ride.",
    price: 20,
    user_id: User.find_by(email: "bob.brown@example.com").id,
    image_url: "https://media.istockphoto.com/id/187863974/fr/photo/femme-%C3%A0-v%C3%A9lo-avec-bande-annonce.jpg?s=612x612&w=0&k=20&c=jdlRUr5C59EXJ4sF0_FoEqw06kCRedIV9k0E0r2Hnp4="
  },
  {
    bike_name: "Long Tail Bike",
    type: "Long Tail",
    description: "Experience the convenience of our Long Tail Bike, perfect for family outings and heavy loads! Designed with extended rear storage, it offers ample space for passengers or cargo, ensuring a comfortable and balanced ride.",
    price: 40,
    user_id: User.find_by(email: "charlie.davis@example.com").id,
    image_url: "https://www.amsterdamair.fr/img/c/5275.jpg"
  },
  {
    bike_name: "Family Cargo Bike",
    type: "Cargo",
    description: "Perfect for family trips, this bike offers plenty of space and safety features to carry kids and groceries. With its robust design, it's ideal for long rides in the park or city, providing comfort and safety for your entire family.",
    price: 28,
    user_id: User.find_by(email: "david.wilson@example.com").id,
    image_url: "https://cdn2.velo-on-line.fr/27488-large_default/biporteur-electrique-leader-fox-e-bike-family-one.webp"
  },
  {
    bike_name: "Sport Tandem",
    type: "Tandem",
    description: "This Sport Tandem is built for speed and endurance, ideal for competitive cyclists and fitness enthusiasts. Its lightweight frame and aerodynamic design make it perfect for racing and long-distance rides.",
    price: 32,
    user_id: User.find_by(email: "eve.clark@example.com").id,
    image_url: "https://www.monequipementsport.fr/media/catalog/product/cache/8c03cdee7bd61547753fd4bd98a5851c/v/e/velo-tandem-galaxy-noir.jpg"
  },
  {
    bike_name: "Kids Trailer",
    type: "Trailer",
    description: "A safe and fun trailer for carrying kids on your cycling adventures. Easy to attach and highly secure. Designed with a sturdy frame and comfortable seating, it ensures a smooth and enjoyable ride for your children.",
    price: 22,
    user_id: User.find_by(email: "frank.wright@example.com").id,
    image_url: "https://www.hamax.com/wp-content/uploads/2022/07/Hamax-breeze-bike-trailer-kids-jogger-stroller2.jpg.webp"
  },
  {
    bike_name: "Electric Cargo Bike",
    type: "Electric Cargo",
    description: "An electric cargo bike to make your transport easier and more efficient, perfect for urban commutes. Its powerful motor and large cargo space make it ideal for carrying heavy loads with minimal effort.",
    price: 45,
    user_id: User.find_by(email: "grace.hall@example.com").id,
    image_url: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQEXwAuxGxwLEK4nYRutb3veQq6elu_KQrgvU-yiu9fLKipxUgw8Ky2hDTJqq_cB77PHPqo30ohHP_EYHTT9_89KfqXNqf9NiFft1mN1l4cR2FelqVVPWtyCg"
  },
  {
    bike_name: "Vintage Long Tail",
    type: "Long Tail",
    description: "A stylish vintage long tail bike, combining classic looks with modern functionality. Great for city rides. Its extended frame provides extra space for passengers or cargo, making it both practical and fashionable.",
    price: 38,
    user_id: User.find_by(email: "hannah.lewis@example.com").id,
    image_url: "https://i.pinimg.com/736x/d9/20/08/d92008ea880f5ae276ec472408d09daa.jpg"
  }
]

bikes.each do |bike|
  new_bike = Bike.new(
    bike_name: bike[:bike_name],
    type: bike[:type],
    description: bike[:description],
    price: bike[:price],
    user_id: bike[:user_id]
  )

  image = URI.open(bike[:image_url])
  new_bike.photo.attach(io: image, filename: bike[:image_url], content_type: "image/png")
  new_bike.save!
end

puts "Created #{User.count} users and #{Bike.count} bikes."
