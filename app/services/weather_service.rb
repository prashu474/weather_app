class WeatherService
    include HTTParty
    base_uri 'http://api.weatherapi.com/v1'
  
    CACHE_EXPIRATION = 30.minutes.freeze
  
    def initialize(zip_code)
      @zip_code = zip_code
      @api_key = ENV['WEATHER_API_KEY']
    end
  
    def fetch_weather
      @cached_data ||= fetch_from_cache
      return @cached_data if @cached_data
  
      data = fetch_from_api
      cache_weather_data(data) if data
      data
    end
  
    private
  
    def fetch_from_cache
      cached = WeatherCache.find_by(zip_code: @zip_code)
      return cached.data if cached&.expires_at&.future?
    end
  
    def fetch_from_api
      response = self.class.get('/forecast.json', query: request_params)
      handle_response(response)
    end
  
    def cache_weather_data(data)
      WeatherCache.find_or_initialize_by(zip_code: @zip_code).update!(
        data: data,
        expires_at: CACHE_EXPIRATION.from_now
      )
    end
  
    def handle_response(response)
      return response.parsed_response if response.success?
  
      Rails.logger.error("Weather API error: #{response.code} - #{response.message}")
      nil
    end
  
    def request_params
      {
        key: @api_key,
        q: @zip_code,
        days: 5,
        aqi: 'no',
        alerts: 'no'
      }
    end
  end
  