require('rspec')
require('pg')
require('actor')
require('movie')

DB = PG.connect(dbname: 'movie_databasse_test')

Rspec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM movies *;')
    DB.exec('DELETE FROM actors *;')
  end
end
