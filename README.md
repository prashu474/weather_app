Weather Forecast Rails Application

Overview

This is a Ruby on Rails application that fetches and displays weather forecast data based on a given zip code. The application retrieves weather data from WeatherAPI and caches the results for 30 minutes to optimize performance.

Features

- Accepts a 5-digit zip code as input.

- Retrieves current temperature and 5-day forecast.

- Displays whether the data is retrieved from cache or API.

- Caches the forecast details for 30 minutes based on zip code.

- Implements error handling for invalid zip codes and API failures.

- Fully tested with RSpec unit tests.

Technologies Used

 - Ruby on Rails (Backend Framework)

 - HTTParty (API Integration)

 - PostgreSQL (Database for caching weather data)

 - Redis (optional) (For caching in-memory storage)

 - RSpec & Capybara (Testing Frameworks)

Installation & Setup

Prerequisites

 - Ruby 3.0+

 - Rails 7+

 - PostgreSQL

 - Redis (optional for caching)

 - WeatherAPI Key (Sign up at WeatherAPI)

Steps

1. Clone the Repository:

git clone https://github.com/yourusername/weather_forecast.git
cd weather_forecast

2. Install Dependencies:

bundle install

3. Setup Database:

rails db:create db:migrate

4. Set up Environment Variables:
Create a .env file and add:

5. WEATHER_API_KEY=your_api_key_here

Start the Server:

rails server

6. Run Tests:

rspec

API & Caching Workflow

1. The user enters a zip code.

2. The system checks if cached data is available and still valid:

  - If cached, it returns the data immediately.

  - If not cached or expired, it fetches fresh data from WeatherAPI, saves it to the database, and then returns it.

Code Structure

* WeatherService

    -Handles API integration.

    - Fetches and processes weather data.

    - Implements caching mechanism.

* WeatherController

    - Manages user input (zip code).

   - Retrieves data via WeatherService.

   - Handles error messages and UI rendering.

* WeatherCache

   - ActiveRecord model to store API responses.

   - Keeps track of expiration times.

* Example Usage

  - Visit the search page:

    http://localhost:3000/weather/search

  - Enter a zip code (e.g., 10001) and submit.

  - View the forecast for the entered location.

  - Check if the data is from cache (Indicator shown on UI).

* Best Practices Followed

   - Object-Oriented Design: Service-based architecture (WeatherService).

    - Encapsulation: Each class handles a single responsibility.

    - Performance Optimization: Caching implemented with expiry.

    - Error Handling: Handles invalid zip codes and API failures.

    - Testing: RSpec tests cover all major functionalities.

* Future Enhancements

     - Add frontend styling with Bootstrap or TailwindCSS.

    - Implement geolocation-based weather search.

    - Extend caching with Redis for faster lookups.

License

   - This project is open-source under the MIT License.

Author

Your Name - Prashu Modi(https://github.com/prashu474/weather_app)

