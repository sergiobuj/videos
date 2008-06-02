class Phone < ActiveRecord::Base
validates_presence_of :code_person, :phone_number
validates_numericality_of :code_person
validate :valid_code_person
has_many :client || :employee , :dependent=>:destroy


protected
def valid_code_person
    errors.add(:code_person, ' (Employee or Client) has to be numerical and greater than zero' ) if code_person.nil? ||
    code_person < 0
end


end
