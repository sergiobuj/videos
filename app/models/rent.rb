class Rent < ActiveRecord::Base
validates_presence_of :rent_code, :movie_code, :client_code, :emp_code, :rent_date, :exp_date
validates_numericality_of :rent_code, :movie_code, :client_code, :emp_code

validate :valid_rent_code, :valid_movie_code, :valid_client_code, :valid_emp_code
validates_uniqueness_of :rent_code
belongs_to :client #, :dependent =>false
has_one :return


protected
def valid_movie_code
    errors.add(:movie_code, ' has to be numerical and greater than zero' ) if movie_code.nil? ||
    movie_code < 0
end

protected
def valid_rent_code
    errors.add(:rent_code, ' has to be numerical adn greater than zero' ) if rent_code.nil? ||
    rent_code < 0
end

protected
def valid_emp_code
    errors.add(:emp_code, ' has to be numerical and greater than zero' ) if emp_code.nil? ||
    emp_code < 0
end

protected
def valid_client_code
    errors.add(:client_code, 'has to be numerical and greater than zero' ) if client_code.nil? ||
    client_code < 0
end

end
