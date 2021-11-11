require 'json'
require 'open-uri'

url = "http://tmdb.lewagon.com/movie/top_rated"

movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)

movie["results"].each do |film|
  title = film["title"]
  overview = film["overview"]
  poster_url = "https://image.tmdb.org/t/p/w500#{film["poster_path"]}"
  rating = film["vote_average"]
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
