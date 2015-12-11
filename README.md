# segments-for-dummies
Bogus api for a 'segmented' audience. Not useful for very much.

## Getting Started
The api is hosted on a server created via the [Phoenix framework](http://www.phoenixframework.org/)

The api data will be populated during setup

See the `.node-version` file for the version of node that the api server was built with

* Make sure postgres access is configured correctly. Look at the "# Configure your database" section of `config/dev.exs`. You will need to update you db username, and maybe a few other things.
* install dependencies: `mix deps.get` and `npm install`
* start the server: `mix phoenix.server`

After you have the server running you may try these commands to see how the api responds:
* `curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://localhost:4000/api/shoppers` to see the full list of shoppers
* `curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://localhost:4000/api/products` to see the full list of products
* curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://localhost:4000/api/shoppers/username/housecat` to see the data for the user whose username (not name), is housecat

run `mix phoenix.routes` for some insight on routes

# The Project
Let's create an interface!

Requirements:
Create a 'default' view for products when there is no user info. This view should list all products by priority with the highest number priority first and the lowest number last. This default view will also have an input which will take a username and if it matches a user in the db, show content specific to the user.

This 'user' page will:
* sort items as before, except that: 1) if the user's `mood` matches a product's `featured_mood` that product will go to the top of the list. In cases where multiple products match sort matched products by priority as well. 2) if the user's `mood` matches a product's `forbidden_mood` that product will not be shown.

Other that the requirements above do whatever you want.




