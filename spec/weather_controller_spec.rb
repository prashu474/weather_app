require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe "GET #search" do
    it "renders the search template" do
      get :search
      expect(response).to render_template(:search)
    end
  end

  describe "POST #show" do
    context "with a valid zip code" do
      it "fetches weather data and renders the show template" do
        # Mock the WeatherService
        weather_data = {
          "current" => { "temp_f" => 70 },
          "forecast" => { "forecastday" => [{ "day" => { "maxtemp_f" => 75, "mintemp_f" => 65 }, "date" => "2025-03-31" }]}
        }
        allow_any_instance_of(WeatherService).to receive(:fetch_weather).and_return(weather_data)

        post :show, params: { zip_code: "90210" }
        expect(assigns(:weather_data)).to eq(weather_data)
        expect(response).to render_template(:show)
      end
    end

    context "with an invalid zip code" do
      it "redirects to search with an error" do
        post :show, params: { zip_code: "abc" }
        expect(flash[:error]).to eq("Please enter a valid 5-digit zip code.")
        expect(response).to redirect_to(weather_search_path)
      end
    end
  end
end