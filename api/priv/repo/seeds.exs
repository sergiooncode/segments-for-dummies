# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Api.Repo.insert! %Api.Shopper{
	name: "hugo",
	mood: "mellow",
	username: "housecat"
}
Api.Repo.insert! %Api.Shopper{
	name: "ted",
	mood: "violent",
	username: "thenooge"
}
Api.Repo.insert! %Api.Shopper{
	name: "david",
	mood: "enigmatic",
	username: "thinwhiteduke"
}

Api.Repo.insert! %Api.Product{
	name: "map",
	priority: 1
}
Api.Repo.insert! %Api.Product{
	name: "flower pot",
	priority: 2
}
Api.Repo.insert! %Api.Product{
	name: "carpet",
	priority: 3
}
Api.Repo.insert! %Api.Product{
	name: "toy",
	priority: 4
}
Api.Repo.insert! %Api.Product{
	name: "garden gnome",
	priority: 5
}
Api.Repo.insert! %Api.Product{
	name: "candle",
	priority: 6,
	forbidden_mood: "mellow"
}
Api.Repo.insert! %Api.Product{
	name: "shoes",
	priority: 7
}
Api.Repo.insert! %Api.Product{
	name: "towels",
	priority: 8
}
Api.Repo.insert! %Api.Product{
	name: "trombone",
	priority: 9
}
Api.Repo.insert! %Api.Product{
	name: "hammer",
	priority: 10,
	featured_mood: "violent"
}
Api.Repo.insert! %Api.Product{
	name: "chair",
	priority: 11,
	featured_mood: "mellow"
}
Api.Repo.insert! %Api.Product{
	name: "shotgun",
	priority: 12,
	forbidden_mood: "violent"
}
Api.Repo.insert! %Api.Product{
	name: "rat poison",
	priority: 13,
	forbidden_mood: "violent"
}
Api.Repo.insert! %Api.Product{
	name: "dark glasses",
	priority: 14,
	featured_mood: "enigmatic"
}
Api.Repo.insert! %Api.Product{
	name: "carnival mask",
	priority: 15,
	featured_mood: "enigmatic"
}


