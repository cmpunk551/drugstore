class PurchasesController < ApplicationController
	before_action :find_purchase, only:[:show, :destroy, :edit, :update]

	def destroy
	@purchase.destroy
    redirect_to purchases_path , :flash => { :error => "Покупка удалена" }
end

def index
		@purchases = Purchase.where.not(:status => "Создана").all
	end
end

def find_purchase
    @purchase=Purchase.find(params[:id])
end

