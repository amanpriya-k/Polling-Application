def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie.select(:id,:title)
       .joins(:actors)
       .group("movies.id")
       .where(actors: { name: those_actors })
       .having('COUNT(actors.id) >= ?', those_actors.length)
       
       
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie.select('(yr/10) * 10 AS dec')
       .group("(yr/10) * 10")
       .order('AVG(movies.score) DESC')
       .pluck("(yr/10) * 10", 'AVG(movies.score)')[0][0]
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  # Actor.select(:name)
  #      .joins('movies')
  #      .where('actors.id IN (
  #                 SELECT id 
  #                 FROM actors
  #                 JOIN castings ON actors.id = castings.actor_id
  #                 JOIN movies on castings.movie_id = movies.id
  #                 GROUP BY movies.id
  #                 WHERE actor IN ? 
  #        )', :movies.actors, Actor.find_by(name: name).id)
  # 
  # Movie.select(*).join(:castings).where('castings.actor_id = ?', name.id)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
   Actor.select('COUNT(*)')
        .left_outer_joins(:castings)
        .where('castings.movie_id IS NULL')
        .group('actor.id')
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
