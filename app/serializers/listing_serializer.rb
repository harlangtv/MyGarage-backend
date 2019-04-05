class ListingSerializer < ActiveModel::Serializer

  attributes :id, :user_id, :vehicle_make, :vehicle_model, :vehicle_year, :mileage, :vehicle_zip_code, :transmission, :vehicle_description

end
