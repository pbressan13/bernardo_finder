class ServicesController < ApplicationController
  before_action :find_service, only: %i[show edit update destroy]
  def show
  end

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service.available_at = parse_list
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @service.update(service_params)
    @service.user = current_user
    @service.available_at = parse_list
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def destroy
    @service.destroy

    redirect_to services_path
  end

  def parse_list
    days_in_list = ""
    params[:service][:available_at].each { |day| days_in_list += "#{day} " }
    days_in_list.strip.gsub(" ", ", ")
  end

  private

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title,
                                    :available,
                                    :available_at,
                                    :description,
                                    :price_hour,
                                    :min_duration,
                                    :max_duration,
                                    images: [])
  end
end
