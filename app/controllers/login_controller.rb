class LoginController < ApplicationController
## Se asegura de que solo se pueda accesar cuando hay una sesión abierta
before_filter :authorize, :except => :login

##Toma los valores y crea un nuevo usuario
  def add_user ##
	  @user = User.new(params[:user])
	  if request.post? and @user.save
	    flash.now[:notice] = "User #{@user.name} created"
	    @user = User.new
	  end
  end

##toma los valores de los campos de la ventana de inicio de sesión
##los evalúa y después muestra la pantalla de inicio de sesión
  def login
	session[:user_id] = nil
	if request.post?
	  user = User.authenticate(params[:name], params[:password])
	  if user
	    session[:user_id] = user.id
	    uri = session[:original_uri]
	    session[:original_uri] = nil

	    redirect_to(:action => "index" )
	  else
	    flash.now[:notice] = "Invalid user or password"
	  end
	end

  end

##termina la sesión de un usuario
  def logout
	session[:user_id] = nil
	flash[:notice] = "Logged out"
	redirect_to(:action => "login" )

  end

##inicio de sesión
##lo primero que se ve después de iniciar la sesión
  def index
  @total_orders = Rent.count - Return.count
  @total_movies = Movie.count
  @total_clients= Client.count
  @total_employees = Employee.count
  @total_categories = Category.count
  @total_users = User.count
  end

##elimina un usuario
  def delete_user
	if request.post?
	  user = User.find(params[:id])
	  begin
	    user.destroy
	    flash[:notice] = "User #{user.name} deleted"
	  rescue Exception => e
	    flash[:notice] = e.message
	  end
	end
	redirect_to(:action => :list_users)

  end

##muestra la lista de los usuarios registrados
  def list_users
 	 @all_users = User.find(:all)
  end
end



