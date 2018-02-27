module DrivyAlexa
  class Booking
    PICK_URL = "http://en.devdrivy.com:3000/cars/%{car_id}/instant_booking"
    BOOKING_URL = "http://en.devdrivy.com:3000/picks/%{pick_id}/booking"

    def perform(car_id:, starts_at:, ends_at:)
      @pick_response = HTTParty.get(
        PICK_URL % { car_id: car_id },
        query: pick_query.merge(
          "start_date": starts_at.strftime("%F"),
          "start_time": starts_at.strftime("%H:%M"),
          "end_date": ends_at.strftime("%F"),
          "end_time": ends_at.strftime("%H:%M"),
        )
      )

      pick_id = JSON.parse(@pick_response.body)["redirect_to"].match(/\d+/).to_s

      @booking_response = HTTParty.post(
        BOOKING_URL % { pick_id: pick_id },
        query: booking_query.merge(
          {}
        )
      )

      @booking_response.code
    end

    private

    def pick_query
      {
        "latitude": 48.876779,
        "longitude": 2.3592853,
        "address": "Gare de l'Est, Paris, France",
        "city_display_name": "Paris",
        "country_scope": "FR",
        "picked_car_ids[]": "2069",
        "from_car_show": true,
        "distance": 600
      }
    end

    def booking_query
      {
        "booking[coupon_code]": "undefined",
        "booking[use_credit]": "true",
        "user[last_name]": "Wilson",
        "user[first_name]": "Howard",
        "user[birth_date(1i)]": "1992",
        "user[birth_date(2i)]": "10",
        "user[birth_date(3i)]": "22",
        "user[birth_place]": "Poole",
        "user[license_number]": "JYTUYTU",
        "user[license_first_issue_date(1i)]": "1987",
        "user[license_first_issue_date(2i)]": "3",
        "user[license_first_issue_date(3i)]": "1",
        "user[license_country]": "FR",
        "user[address_line1]": "100 rue du Temple",
        "user[address_line2]": "",
        "user[postal_code]": "Paris",
        "user[city]": "75001",
        "user[country]": "FR",
        "user[phone_country]": "FR",
        "user[phone_number_national]": "0612121212",
        "booking[cdw_level]": "none",
        "disable_3ds": "1",
        "booking[remote_source_id]": "src_1C0AAeCT1OU7zV9dhgfdsgf",
        "conditions_acceptance": ""
      }
    end
  end
end
