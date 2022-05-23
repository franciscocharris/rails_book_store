# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({ name: 'Star Wars', first_name: 'user 1', last_name: 'apellido',
  Date_birth: '2000-01-23', email: 'user1@gmail.com' , encrypted_password: '12345678' })