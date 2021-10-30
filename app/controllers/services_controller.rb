class ServicesController < ApplicationController
  before_action :find_service, only: %i[show edit]
  def show
  end

  def index
    @services = Services.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = service.new(service_params)
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @service.update(services_params)
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

  private

  def find_service
    @services = Service.find(params[:id]).where(user: current_user)
  end

  def service_params
    params.require(:service).permit(:name, :address, :category, :phone_number)
  end
end
