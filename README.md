# README

# Weather App

A Ruby on Rails application that fetches and displays weather data based on a user-provided location (zip code or city name).

## Features
- Accepts a zip code or city name as input, with an optional country code.
- Retrieves current temperature, today's high/low, and a 5-day forecast using the WeatherAPI.
- Caches forecast data for 30 minutes in the database to reduce API calls.
- Includes unit tests for the controller and service.

## Setup Instructions
1. **Prerequisites**:
   - Ruby 3.2.0
   - Rails 7.0.8
   - PostgreSQL

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/prashu474
    cd weather_app
