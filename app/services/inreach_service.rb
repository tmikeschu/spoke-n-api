class InreachService
  def self.latest_coordinates
    new.latest_coordinates
  end

  def latest_coordinates
    { lat: latitude, lng: longitude }  
  end

  private 
    def conn
      @conn ||= Faraday.new("https://inreach.garmin.com")
      @conn.basic_auth(ENV["inreach_user"], ENV["inreach_pw"])
      @conn
    end

    def response
      conn.get("/feed/Share/TommyCrosby")
    end

    def response_data
      response.body
    end

    def latitude
      Nokogiri.XML(response_data).css("Data[name='Latitude'] value").text.to_d
    end

    def longitude
      Nokogiri.XML(response_data).css("Data[name='Longitude'] value").text.to_d
    end
end

