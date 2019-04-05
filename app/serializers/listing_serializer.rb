class ListingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :vehicle_make, :vehicle_model, :vehicle_year, :mileage, :vehicle_zip_code, :transmission, :vehicle_description

end
