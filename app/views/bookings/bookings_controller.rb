class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show edit update destroy]
  def show
  end

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.available_at = parse_list
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    @booking.user = current_user
    @booking.available_at = parse_list
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy


  end

  def create_rating
  end

  def new_rating
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id,
                                    :service_id,
                                    :total_price,
                                    :duration,
                                    :book_date,
                                    :accepted,
                                    :rating,
                                    images: [])
  end
end
