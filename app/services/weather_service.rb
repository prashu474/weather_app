class WeatherService
    include HTTParty
    base_uri 'http://api.weatherapi.com/v1'
  
    def initialize(zip_code)
      @zip_code = zip_code
      @api_key = ENV['WEATHER_API_KEY']
    end
  
    def fetch_weather
      # Check cache first
      cached = WeatherCache.find_by(zip_code: @zip_code)
      if cached && cached.expires_at > Time.now
        return cached.data
      end
  
      # Fetch from API if not cached or expired
      response = self.class.get('/forecast.json', query: {
        key: @api_key,
        q: @zip_code,
        days: 5,
        aqi: 'no',
        alerts: 'no'
      })
  
      data = handle_response(response)
      return nil unless data
  
      # Cache the data for 30 minutes
      WeatherCache.find_or_initialize_by(zip_code: @zip_code).update!(
        data: data,
        expires_at: 30.minutes.from_now
      )
      data
    end
  
    private
  
    def handle_response(response)
      if response.success?
        response.parsed_response
      else
        Rails.logger.error("Weather API error: #{response.code} - #{response.message}")
        nil
      end
    end
  end