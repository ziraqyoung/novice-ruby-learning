require './room'
require './dungeon'
require './player'


me = Player.new('Fred Bloggs')
my_dungeon = Dungeon.new(me)

# Add rooms to the dungeon
my_dungeon.add_room(:large_cave, 'Large Cave', 'a large carnavous cave', { west: :smallcave })

my_dungeon.add_room(:small_cave, 'Small Cave', 'a small claustrophobic cave', { east: :largecave })

# start the dungeon by placing the player in the large cave
my_dungeon.start(:large_cave)

my_dungeon.go(:west)
my_dungeon.go(:east)
