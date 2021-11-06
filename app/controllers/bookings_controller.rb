class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show edit update destroy]
  def show
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.service = @service
    @booking.total_price = @service.price_hour.to_i * @booking.duration.to_i
    if @booking.save
      redirect_to my_bookings_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
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
