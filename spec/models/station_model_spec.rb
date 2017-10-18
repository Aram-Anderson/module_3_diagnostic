require 'rails_helper'

describe Station, type: :model do
  it "has valid attributes" do
    attrs = {
      station_name: "Bill's alt Fuel",
      distance: 8.45,
      access_days_time: "All the time",
      fuel_type_code: "All the fuels",
      street_address: "756 Street st",
      state: "CO",
      city: "Denver",
      zip: "80205"
    }

    station = Station.new(attrs)

    expect(station).to respond_to(:name)
    expect(station).to respond_to(:distance)
    expect(station).to respond_to(:access_times)
    expect(station).to respond_to(:address)
    expect(station).to respond_to(:fuel_types)
    expect(station.name).to eq("Bill's alt Fuel")
    expect(station.distance).to eq(8.45)
    expect(station.access_times).to eq("All the time")
    expect(station.address).to eq("756 Street st, Denver, CO, 80205")
    expect(station.fuel_types).to eq("All the fuels")
  end
end
