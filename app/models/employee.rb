class Employee < ActiveRecord::Base
validates_presence_of :emp_code, :emp_id, :emp_name, :emp_surname, :start_date, :emp_state, :home_address
validates_numericality_of :emp_code, :emp_id
validate :valid_emp_code, :valid_emp_id
validates_uniqueness_of :emp_code, :emp_id
has_many :phone#, :dependent=>false


protected
def valid_emp_code
    errors.add(:emp_code, ' to be numerical and greater than zero' ) if emp_code.nil? ||
    emp_code < 0
end

protected
def valid_emp_id
    errors.add(:emp_code, ' to be numerical and greater than zero' ) if emp_id.nil? ||
    emp_id < 0
end




end
