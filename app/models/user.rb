## 'require' para sacar el hash
require 'digest/sha1'

class User < ActiveRecord::Base

validates_presence_of     :name ##valida que se escriba algo
validates_uniqueness_of   :name ##valida que no exista un nombre igual
attr_accessor :password_confirmation 
validates_confirmation_of :password 

##error que indica si no se ha guardado ninguna contraseña 
##después de sacarle el hash
def validate
  errors.add_to_base("No password" ) if hashed_password.blank?
end

##Permite modificar la contraseña
def password
  @password
end

##guarda la contraseña
def password=(pwd)
  @password = pwd
  return if pwd.blank?
  create_new_salt
  self.hashed_password = User.encrypted_password(self.password, self.salt)
end

## Aquí se controla que el nombre de usuario y contraseña coincidan
## se se agrega la semilla a la contraseña y se le calcula el hash
## si es igual al hash que se tiene guardado para ese usuario, se retorna ese usuario
def self.authenticate(name, password)
  user = self.find_by_name(name)
  if user
    expected_password = encrypted_password(password, user.salt)
    if user.hashed_password != expected_password
       user = nil
    end
  end
  user
end

## si va a elimina el último usuario, se devuelve el mensaje
## que no se puede eliminar
def after_destroy
  if User.count.zero?
    raise "Can't delete last user"
  end
end


private ##métodos privados

##Toma la contraseña y le agrega strings para hacerla mas
## larga y después le calcula el hash
def self.encrypted_password(password, salt)
  string_to_hash = password + "wibble" + salt
  Digest::SHA1.hexdigest(string_to_hash)
end

##crea una 'semilla' al azar para agregarla
##a la contraseña y calcular el hash
def create_new_salt
  self.salt = self.object_id.to_s + rand.to_s
end

end
