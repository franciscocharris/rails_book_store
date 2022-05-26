# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'securerandom'

my_user = User.create!({ first_name: 'user 1', last_name: 'apellido',
                         Date_birth: '2000-01-23', email: 'user@gmail.com', password: '12345678' })

my_author = Author.create!({ name: 'author 1 user', user_id: my_user.id })
my_tag = Tag.create!({ name: 'tag 1 user', author_id: my_author.id })
my_book = Book.create!({ code: SecureRandom.uuid, name: Faker::Book.title, author_id: my_author.id,
                       description: "Molestiae ratione eo", price: 555, n_pages: 10,
                       d_published: "2003-01-01", active: 1 })
books_tags = BooksTag.create!({ book_code: my_book.code, tag_id: my_tag.id })
comment = Comment.create!({message: Faker::Lorem.paragraph, user_id: my_user.id, book_code: my_book.code, approved: true })

5.times do
  user = User.create!({ first_name: Faker::Name.first_name,
                        last_name: Faker::Name.middle_name,
                        Date_birth: Faker::Date.in_date_period(month: 2),
                        email: Faker::Internet.email,
                        password: '12345678' })

  author = Author.create!({ name: "author #{Faker::Book.author}", user_id: user.id })
  tag = Tag.create!({ name: "tag #{Faker::Book.genre}", author_id: author.id })
end

5.times do
  book = Book.create!({code: SecureRandom.uuid, name: Faker::Book.title, author_id: 2,
    description: Faker::Lorem.paragraph, price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    n_pages: Faker::Number.number(digits: 4),
    d_published: Faker::Date.in_date_period(month: 2), active: [true, false].sample })

  BooksTag.create!({book_code: book.code, tag_id: rand(1..5) })
  Comment.create!({message: Faker::Lorem.paragraph, user_id: rand(1..6), book_code: book.code, approved: [true, false].sample })
end