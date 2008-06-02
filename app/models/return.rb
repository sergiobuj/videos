class Return < ActiveRecord::Base
validates_presence_of :rent_code, :return_date, :charges
validates_numericality_of :rent_code, :charges

#belongs_to :rent, :dependent=>:destroy

validate :valid_rent_code, :valid_charges
protected
def valid_rent_code
    errors.add(:rent_code, ' has to be numerical and greater than zero' ) if rent_code.nil? ||
    rent_code < 0
end

protected
def valid_charges
    errors.add(:charges, ' to be numerical and greater/equal than zero' ) if charges.nil? ||
    charges <= -1
end


end
