class UsersController < ApplicationController

before_filter :login_required,:except=>[:home,:authenticate,:login,:new,:create,:show]

  
  def home
    #render :template=>'users/home'
  end
  def authenticate
     @user = User.new(params[:userform])
     valid_user = User.find(:first,:conditions => ["email = ? and password = ?",@user.email, @user.password])

     if valid_user
        session[:user_id]=valid_user.email
        redirect_to :action => 'private'
        #session[:return_to] = request.request_uri
     else
        flash[:error] = "Invalid User/Password"
        redirect_to :action=> 'login'
     end
  end

  def login
  end

  def private
  if !session[:user_id]
    redirect_to :action=> 'login'
    end
  end

  def logout
      if session[:user_id]
         reset_session
          redirect_to :action=> 'login'
      end
  end

  def edit_password
       @user = User.find_by_email(session[:user_id])
  end

  def update_password
    puts "--------------------update"
     @user = User.find_by_email(session[:user_id])
     puts "--------------------update"
      puts @user

    #respond_to do |format|
       if @user.update_attributes(params[:user])
          flash[:notice] = 'password changed successfully.'
redirect_to :action=> 'home'
          # format.html { redirect_to(@user) }
           #format.xml  { head :ok }
       else
         redirect_to :action=> 'home'
          # format.html { render :action => "edit" }
           #format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
       end
     #end

  end

  # GET /users
  # GET /users.xml
  def index
    if is_customer? or is_employee?
          @users = User.find_all_by_email(session[:user_id])
    elsif is_admin?
          @users = User.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
