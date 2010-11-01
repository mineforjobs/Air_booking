class SeatsController < ApplicationController
  def show
    @seat=Seat.find(params[:id])
  end

  def index
    @seats=Seat.find(:all)
  end

  def new
    @seat=Seat.new
  end

  def create
    
    @seat = Seat.new(params[:seat])
    if @seat.save
      render :partial=>'flights/seat_list', :locals=>{:seats=>@seat.flight.seats}
      flash[:notice] = "Saved Successfully"
    else
      flash[:notice] = "Record not saved,Missing/invalid input !"
    end

  end

  def edit
    @seat = Seat.find(params[:id])
  end

  def update
      @seat = Seat.find(params[:id])
      @seat.update_attributes(params[:seat])

    redirect_to "/seats/#{@seat.id}"
  end

  def delete
    @seat = Seat.find(params[:id])
    @seat.delete
    redirect_to "/seats/"
  end

  def flight_seats
    @flight=Flight.find(params[:flight_id])
    render :partial=>"flights/seat_list", :locals=>{:seats=>@flight.seats}
  end


end
