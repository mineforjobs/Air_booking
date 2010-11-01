# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def login_required
        if session[:user_id].nil?
          flash[:notice] = "Login Required !"
          redirect_to(:controller => "/users", :action => "login")
        else
          session[:return_to] = request.request_uri
        end
      end
      def get_currentUser
        @user=User.find_by_email(session[:user_id])
        return  @user

      end
      def is_admin?
       if User.find_by_email(session[:user_id]) and (User.find_by_email(session[:user_id]).role).to_s == "admin"
          puts "in true"
          return true
        else
          puts "in false"
           return false
         end
     end
     def is_customer?
        if User.find_by_email(session[:user_id]) and (User.find_by_email(session[:user_id]).role).to_s== "customer"
            return true
         else
           return false
         end
     end
     def is_employee?
       if User.find_by_email(session[:user_id]) and (User.find_by_email(session[:user_id]).role).to_s == "employee"
            return true
        else
           return false
         end
     end
     def is_guest?
        if session[:user_id].nil?
          return true
        else
           return false
         end
     end
end
