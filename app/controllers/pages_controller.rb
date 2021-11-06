class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def search
    @bernardos = params.dig(:search, :query).present? ? Service.search_by_service(params.dig(:search, :query)) : []
  end
end
