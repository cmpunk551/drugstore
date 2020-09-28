class MedicinesController < ApplicationController
	before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :set_recipes, only: [:new, :edit, :create, :update]
	before_action :set_suppliers, only: [:new, :edit, :create, :update]
  before_action :find_medicine, only:[:show, :destroy, :edit, :update]
  before_action :create_purchase_medicine, only:[:show, :index]


  
  def new
	@medicine = Medicine.new
  end

  def create
  	@medicine = Medicine.new(medicines_params)
  	@medicine.category_id = params[:category_id]
  	@medicine.suppliers_id = params[:suppliers_id]
  	if @medicine.save
  		redirect_to root_path
  	else
  		render 'new'
  	end 
  end

  def set_categories
	@categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def set_suppliers
	@suppliers = Supplier.all.map{ |s| [s.name, s.id]}
  end

  def set_recipes
  @recipes = Recipe.all.map{ |r| [r.reason, r.id, r.medicine_id]}
  end

  def index  	
    if params[:search]
      @Medicines = Medicine.search(params[:search])
      else
        if params[:category_id].blank?
          @Medicines = Medicine.all.order("created_at DESC")  # сортировка по алфавиту
        else
          @Category = Category.find_by(:id => params[:category_id])
          @Medicines = Medicine.where(:category_id => @Category.id).order("created_at DESC")
        end
    end
    
  end

   def update
    if @medicine.update(medicines_params)
      redirect_to medicine_path(@medicine)
    else
      render 'edit'
    end
   end

   def destroy
    @medicine.destroy
    redirect_to root_path, :flash => { :error => "Товар удален" }
  end

  def show
    @medicine = Medicine.find(params[:id])
  end

private

def medicines_params
	# NOTE: Using `strong_parameters` gem
	params.require(:medicine).permit(:name, :category_id, :brand, :price, :amount, :supply_number, :suppliers_id, :photo)
end

def find_medicine
    @medicine=Medicine.find(params[:id])
    end
def create_purchase_medicine
    @purchase_medicine = current_purchase.purchase_medicines.new unless current_user == nil 
end     

end
