require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/actor")
require("./lib/movie")
require("pg")

get("/") do
  @actors = Actor.all()
  @movies = Movie.all()
  erb(:index)
end

get("/actors") do
  @actors = Actor.all()
  erb(:actors)
end

get("/movies") do
  @movies = Movie.all()
  erb(:movies)
end

post("/actors") do
  name = params.fetch("name")
  actor = Actor.new({:name => name, :id => nil})
  actor.save()
  @actors = Actor.all()
  erb(:actors)
end

post("/movies") do
  name = params.fetch("name")
  movie = Movie.new({:name => name, :id => nil})
  movie.save()
  @movies = Movie.all()
  erb(:movies)
end

get("/actors/:id") do
  @actor = Actor.find(params.fetch("id").to_i())
  @movies = Movie.all()
  erb(:actor_info)
end

get("/movies/:id") do
  @movie = Movie.find(params.fetch("id").to_i())
  @actors = Actor.all()
  erb(:movie_info)
end
