module DrivyAlexa
  class ProgressiveResponse
    def initialize(request)
      @request_id = request.id
      @api_endpoint = request.api_endpoint
      @api_access_token = request.api_access_token
    end

    def respond(speech)
      HTTParty.post(
        "#{@api_endpoint}/v1/directives",
        headers: { "Authorization" => "Bearer #{@api_access_token}", 'Content-Type' => 'application/json' },
        body: {
          "header":{
            "requestId": @request_id
          },
          "directive":{
            "type": "VoicePlayer.Speak",
            "speech": speech
          }
        }.to_json
      )
    end
  end
end
