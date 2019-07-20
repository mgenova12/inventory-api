class Mutations::UpdateLocationRowOrder < Mutations::BaseMutation
  argument :location_ids, [Integer], required: true

  field :locations, [Types::LocationType], null: false
  field :errors, [String], null: false

  def resolve(location_ids:)
    locations = []

    location_ids.each_with_index do |id, idx|
      location = Location.find(id)
      if location.update(row_order: idx)
        locations << location
      end
    end
    
    {
      locations: locations,
      errors: []
    }

  end


end