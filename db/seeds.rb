# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Luke', email: 'luke@example.com', password_digest: BCrypt::Password.create('password'))
User.create(name: 'Lucas', email: 'lucas@example.com', password_digest: BCrypt::Password.create('password'))
User.create(name: 'Lucas2', email: 'lucas@example.com', password_digest: BCrypt::Password.create('password'))
User.create(name: 'Lucas3', email: 'lucas@example.com', password_digest: BCrypt::Password.create('password'))
User.create(name: 'Lucas4', email: 'lucas@example.com', password_digest: BCrypt::Password.create('password'))
User.create(name: 'Lucas5', email: 'lucas@example.com', password_digest: BCrypt::Password.create('password'))
User.create(name: 'Lucas6', email: 'lucas@example.com', password_digest: BCrypt::Password.create('password'))