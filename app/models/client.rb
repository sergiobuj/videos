class Client < ActiveRecord::Base
validates_presence_of :client_code, :client_id, :client_name, :client_surname, :sing_up_date, :birth_date, :client_state, :home_address
validates_numericality_of :client_code, :client_id



validate :valid_client_code, :valid_client_id
protected
def valid_client_code
    errors.add(:client_code, ' has to be numerical and greater than zero' ) if client_code.nil? ||
    client_code < 0
end

protected
def valid_client_id
    errors.add(:client_code, ' has to be numerical and greater than zero' ) if client_id.nil? ||
    client_id < 0
end



end
