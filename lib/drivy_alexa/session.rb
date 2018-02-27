module DrivyAlexa
  class Session
    attr_reader :duration

    def initialize(request)
      @request = request

      @start_time = request.session_attribute("start_time")
      @start_date = request.session_attribute("start_date")
      @duration   = request.session_attribute("duration")
    end

    def book_mode!
      parse_search_slots
      validate_search_data

      @mode = DrivyAlexa::MODES[:book]
    end

    def attributes
      {
        mode: @mode.to_s,
      }.tap do |attributes|
        attributes["start_time"] = @start_time if @start_time
        attributes["start_date"] = @start_date if @start_date
        attributes["duration"]   = @duration if @duration
      end
    end

    private

    def parse_search_slots
      @start_time = @request.slot_value("start_time") # e.g. "05:00"
      @start_date = @request.slot_value("start_date") # e.g. "2018-03-02" (not required)
      @duration   = @request.slot_value("duration")   # e.g. "P2D"
    end

    def validate_search_data
      unless @start_time.present?
        raise "A start time is required to make a booking"
      end

      unless @duration.present?
        raise "A duration is required to make a booking"
      end
    end
  end
end
