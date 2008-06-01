class Movie < ActiveRecord::Base
validates_presence_of :movie_code, :movie_title, :movie_original_title, :movie_year, :movie_director, :genre, :country, :place_in_store, :category_code
validates_numericality_of :movie_code, :movie_year, :category_code
validate :valid_year, :valid_movie_code, :valid_category_code 


protected
def valid_movie_code
    errors.add(:movie_code, ' has to be numerical and greater than zero' ) if movie_code.nil? ||
    movie_code < 0
end

protected
def valid_category_code
    errors.add(:category_code, ' has to be numerical and greater than zero' ) if category_code.nil? ||
    category_code < 0
end



protected
def valid_year
    errors.add(:movie_year, 'Has to be a Valid year and a 4 digit number' ) if movie_year.nil? ||
    movie_year < 1800
end

end
