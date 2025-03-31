class WeatherController < ApplicationController
  def search
  end

  def show
    @zip_code = params[:zip_code]
    unless @zip_code.match?(/\A\d{5}\z/)
      flash[:error] = "Please enter a valid 5-digit zip code."
      return redirect_to weather_search_path
    end

    weather_service = WeatherService.new(@zip_code)
    @weather_data = weather_service.fetch_weather

    if @weather_data
    else
      flash[:error] = "Could not retrieve weather data for zip code #{@zip_code}."
      redirect_to weather_search_path
    end
  end
end