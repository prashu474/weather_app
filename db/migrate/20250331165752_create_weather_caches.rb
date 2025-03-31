class CreateWeatherCaches < ActiveRecord::Migration[8.0]
  def change
    create_table :weather_caches do |t|
      t.string :zip_code
      t.jsonb :data
      t.datetime :expires_at

      t.timestamps
    end
  end
end
