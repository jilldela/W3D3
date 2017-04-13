# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jill = User.create!(email: 'jilluseshotmail@hotmail.com')
allen = User.create!(email: 'allenusesxanga.com')
eric = User.create!(email: 'emailprince48@hubby.com')
miriam = User.create!(email: 'scientistboss@phd.com')

# jill = User.find_by(email: 'jilluseshotmail@hotmail.com')
# allen = User.find_by(email: 'allenusesxanga.com')
# eric = User.find_by(email: 'emailprince48@hubby.com')
# miriam = User.find_by(email: 'scientistboss@phd.com')

xanga = ShortenedUrl.create!(jill, 'www.xanga.com')
facebook = ShortenedUrl.create!(allen, 'www.facebook.com')
aol = ShortenedUrl.create!(jill, 'www.aol.com')
netscape = ShortenedUrl.create!(allen, 'www.netscape.com')
neopets = ShortenedUrl.create!(miriam, 'www.neopets.com')
myspace = ShortenedUrl.create!(eric, 'www.myspace.com')
