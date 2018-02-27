module DrivyAlexa
  class Search
    URL = "http://www.devdrivy.co.uk:3000/api/v1/order/picks"

    def perform(starts_at:, ends_at:)
      @response = HTTParty.get(
        URL,
        query: query.merge(
          "start_date": starts_at.strftime("%F"),
          "start_time": starts_at.strftime("%H:%M"),
          "end_date": ends_at.strftime("%F"),
          "end_time": ends_at.strftime("%H:%M"),
        )
      )
    end

    def total_count
      @response.dig("pagination", "total_count").to_i
    end

    # TODO: Wrap cars?
    def cars
      @response["cars"]
    end

    private

    def query
      {
        "address": "Gare de l'Est, Paris, France",
        "address_source": "google",
        "city_display_name": "Paris",
        "country_scope": "FR",
        "distance": 600,
        "latitude": 48.876779,
        "longitude": 2.3592853,
        "page": 1,
        "per_page": 20
      }
    end
  end
end
