class Shipment < ApplicationRecord
    enum status: {
        PRE_TRANSIT: 'PRE_TRANSIT',
        TRANSIT: 'TRANSIT',
        DELIVERED: 'DELIVERED',
        FAILURE: 'FAILURE',
        CANCELLED: 'CANCELLED'
    }

    belongs_to :trucker
end
