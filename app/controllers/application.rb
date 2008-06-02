# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e49d37925d76c462e41ed6a83aea855d'

session :session_key => '_videos_session_id'
private
def authorize
  unless User.find_by_id(session[:user_id])
    flash[:notice] = "log in first"
    redirect_to(:controller => "login" , :action => "login" )
  end
end




end
