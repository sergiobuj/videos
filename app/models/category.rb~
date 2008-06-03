class Category < ActiveRecord::Base
validates_presence_of :category_code, :rent_price, :rent_days, :category_name
validates_numericality_of :category_code, :rent_price, :rent_days
validates_uniqueness_of :category_code

validate :valid_category_code, :valid_rent_price, :valid_rent_days
has_many :movie#, :dependent => false


protected
def valid_category_code
    errors.add(:category_code, ' has to be numerical and greater than zero' ) if category_code.nil? ||
    category_code < 0
end

protected
def valid_rent_price
    errors.add(:rent_price, ' has to be numerical and greater than zero' ) if rent_price.nil? ||
    rent_price < 0
end

protected
def valid_rent_days
    errors.add(:rent_days, ' has to be numerical and greater than zero' ) if rent_days.nil? ||
    rent_days < 0
end





end
