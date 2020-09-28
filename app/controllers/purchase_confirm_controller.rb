class PurchaseConfirmController < ApplicationController
		def index
		@purchase = current_purchase
		current_purchase.update( :status => "Завершена")
		@purchase_medicines = @purchase.purchase_medicines.all
		puts @purchase_medicines
		@purchase_medicines.each do |pm|
			@medicine = Medicine.find(pm.medicine_id)
			@medicine.amount = @medicine.amount - pm.amount
			@medicine.save
		end
		redirect_to root_path
	end 
end
