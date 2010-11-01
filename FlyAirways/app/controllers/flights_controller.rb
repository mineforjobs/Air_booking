class FlightsController < ApplicationController

  
  def show
    @flight=Flight.find(params[:id])
  end
  def payment
    @curr_user=get_currentUser
    @user = User.find(@curr_user.id)
    @flight=Flight.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def paid
    
      @flight_instArr = FlightInst.find(:all,:conditions=>['flight_id=?',params[:id]])
      @flight_inst=@flight_instArr[0]

    if @flight_inst.seat_availablity!=0
      @curr_user=get_currentUser
      puts "Current user"

      @user = User.find(@curr_user.id)
      puts @user.id
      #insert into seat
          @seat=Seat.new
          @seat.flight_inst_id=@flight_inst.id
          @seat.user_id=@user.id
          puts "seats 2"

          if   @seat.save
               puts "seats saved 2"
                #update seat_availability
                  @flight_inst.seat_availablity=@flight_inst.seat_availablity-1
                  puts @flight_inst.seat_availablity
                  @flight_inst.update_attribute(:seat_availablity,@flight_inst.seat_availablity)

                render :template => "/flights/paid"
         else
           flash[:notice] = "error,can not save the record"
         end
    end
  end

  def index
    @flights=Flight.find(:all,:conditions=>["destination=?","nowhere"])
    flash[:notice] = "Please provide search criterias."
    #@flights=Flight.find(:all)
  end

  def new
    @flight=Flight.new
  end

  def create
      @flight=Flight.new(params[:flight])
     # @flight.destination=params[:flight][:destination]
      #@flight.source=params[:flight][:source]
       if @flight.save
        redirect_to "/flights/#{@flight.id}"
        flash[:notice] = "Saved Successfully"
       else
         render :template => '/flights/new'
      end
  end

  def edit
    @flight=Flight.find(params[:id])
  end

  def update
      @flight=Flight.find(params[:id])
      if @flight.update_attributes(params[:flight])
        redirect_to "/flights/#{@flight.id}"
        flash[:notice] = "Updated Successfully"
       else
         render :template => "/flights/edit"
       
     end
  end

  def delete
    @flight=Flight.find(params[:id])
    @flight.delete
    redirect_to "/flights/"
  end

  def find
    session[:search_date]=params[:flight][:date]
    
      if session[:search_date].nil?
            flash[:notice] = "Please provide search date."
      else
          @flights=Flight.find(:all, :conditions =>["destination=? and source=? ",params[:flight][:destination],params[:flight][:source]])
        #  puts @flights[0].departure_time.to_s(:time)
          if @flights.size == 0
            flash[:notice] = "Sorry, No flight available for given criteria !"
            #@flights=Flight.find(:all)
          else
            flash[:notice] = ""
          end
      end
  end

  def check_availability
    puts "in check ######"
    puts session[:search_date]

    @flight=Flight.find(params[:id])
    
    @flight_instArray = FlightInst.find(:all,:conditions =>["flight_id=? and date=?",params[:id],session[:search_date]])
    @flight_inst = @flight_instArray[0]
    puts "{{{{{{{{{{{{{{@flight_inst.size"
    puts @flight_instArray.size
    puts "{{{{{{{{{{{{{{@flight_inst.size"
    
    if @flight_instArray.size > 0
      puts "data exist&&&&"
      #show seat_available & book link
      
      @avail=@flight_inst.seat_availablity
      puts "avail ^^^^^^^^^^^"
      puts @avail
      render :template => "/flights/check_availability"
    else
      puts "data not&&&"
      @flight_inst = FlightInst.new
      #get capacity from flight and save as seat_availablity with given date and id
      @flight_inst.flight_id=params[:id]
      @flight_inst.seat_availablity = @flight.capacity
      @flight_inst.date=session[:search_date]
      @flight_inst.save
      render :template => "/flights/check_availability"
   end

  end

end

