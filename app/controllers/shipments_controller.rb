class ShipmentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :current_trucker
    before_action :shipment, only: :update

    def index
        @shipments = current_trucker.shipments
        # render @shipments
    end

    def create
        shipment = current_trucker.shipments.create!(shipment_params)

        redirect_to shipments_path, notice: 'Shipment Create Success'
    end

    def update
        shipment.update(update_params)

        redirect_to shipments_path, notice: 'Shipment Update Success'
    end

    private

    def current_trucker
        Trucker.first
    #    Trucker.find_by!(email: params[:trucker_email])
    end

    def shipment_params
        params.permit(:lat, :long, :product, :description, :delivery_date)
    end

    def update_params
        params.permit(:id, :status, :description)
    end

    def shipment
        Shipment.find(update_params[:id])
    end
end
