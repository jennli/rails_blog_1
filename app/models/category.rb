class Category < ActiveRecord::Base
  has_many :posts, dependent: :nullify

  # MUSIC = "Music"
  # TRAVEL = "Travel"
  # WORK = "Work"
  # EDUCATION = "Education"
  # PROGRAMMING = "Programming"
  # MOVIES = "Movies"
  # ROMANCE = "Romance"
  # FAMILY = "Family"
  # RANDOM = "Random"
  # BOOKS = "Books"
  #

end
