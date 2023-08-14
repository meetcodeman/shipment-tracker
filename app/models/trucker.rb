class Trucker < ApplicationRecord
    has_many :shipments, dependent: :destroy
end
