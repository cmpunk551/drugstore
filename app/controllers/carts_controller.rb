class CartsController < ApplicationController
	def show
    @purchase_medicines = current_purchase.purchase_medicines.all
  	end
end
