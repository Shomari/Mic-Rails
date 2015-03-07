# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


player1 = Player.create!(email: "test1@gmail.com", password: "password")
player2 = Player.create!(email: "test2@gmail.com", password: "password")
player3 = Player.create!(email: "test3@gmail.com", password: "password")
player4 = Player.create!(email: "test4@gmail.com", password: "password")

xbox = Console.create!(name: "XB1")
playstation = Console.create!(name: "PS4")

PlayersConsole.create!(player: player1, console: xbox, gtag: "xbGtag")
PlayersConsole.create!(player: player1, console: playstation, gtag: "PStag")
PlayersConsole.create!(player: player2, console: xbox, gtag: "2xboxtag")
PlayersConsole.create!(player: player2, console: playstation, gtag: "2PStag")

halo = Game.create!(name: "halo")
gta5 = Game.create!(name: "GTAV")
destiny = Game.create!(name: "Destiny")

ConsolesGame.create!(console: xbox, game: halo)
ConsolesGame.create!(console: xbox, game: gta5)
ConsolesGame.create!(console: playstation, game: gta5)
ConsolesGame.create!(console: xbox, game: destiny)
ConsolesGame.create!(console: playstation, game: destiny)
