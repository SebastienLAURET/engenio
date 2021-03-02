# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "test@email.com", password: "Password1")
Doorkeeper::Application.create(name: "MyApp", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: ["read", "write"])
