class Station

attr_reader :name,
            :distance,
            :access_times,
            :fuel_types,
            :address

  def initialize(attrs = {})
    @name = attrs[:station_name]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
    @fuel_types = attrs[:fuel_type_code]
    @street_address = attrs[:street_address]
    @city = attrs[:city]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @address = get_address
  end

  def get_address
    "#{street_address}, #{city}, #{state}, #{zip}"
  end
  private

  attr_reader :street_address, :city, :state, :zip
end
