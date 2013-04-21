class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def confirm
    set_booking
    render action: :new unless @booking.valid?
  end

  def create
    set_booking
    BookingNotifier.notify(@booking).deliver
  end

  private
  def set_booking
    @booking = Booking.new(params[:booking])
    @booking.members = @booking.members.split(',').uniq.select{|s| s.length > 0}.join(',')
  end
end
