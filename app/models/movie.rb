class Movie < ActiveRecord::Base
  def self.all_ratings
    # Return all unique ratings from the database
    # If no movies exist, return the standard MPAA ratings
    ratings = Movie.distinct.pluck(:rating).compact
    ratings.any? ? ratings.sort : ['G', 'PG', 'PG-13', 'R']
  end

  def self.with_ratings(ratings_list)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    if ratings_list.present?
      Movie.where(rating: ratings_list)
    else
      Movie.all
    end
  end
end
