class PurchaseMedicinesController < ApplicationController
	before_action :medicine_params, only: [:create]

  def create
    @purchase = current_purchase
    if PurchaseMedicine.where(:purchase_id => @purchase.id).find_by(:medicine_id => params[:purchase_medicine][:medicine_id]).nil?
      @medicine = @purchase.purchase_medicines.new(medicine_params)
      puts @medicine.medicine_id
      @purchase.user_id = current_user.id
      @purchase.save
      session[:purchase_id] = @purchase.id
      puts @purchase.errors.full_messages.to_sentence
      redirect_to medicines_path
    else
      redirect_to cart_path
    end
  end

  def destroy
    @purchase = current_purchase
    @medicine = @purchase.purchase_medicines.find(params[:id])
    @medicine.destroy
    @purchase.user_id = current_user.id
    @purchase.save
    redirect_to cart_path, :flash => { :error => "Товар удален из корзины" }
  end

  def update
    @purchase = current_purchase
    @medicine = @purchase.purchase_medicines.find(params[:id])
    if params[:item][:amount].to_i <= Medicine.find(params[:item][:medicine_id]).amount.to_i
      @medicine.update_attribute(:amount, params[:item][:amount])
      @medicine.save
      @purchase.save
      redirect_to cart_path, :flash => { :notice => "Количество товаров в корзине обновлено" }
    else
      redirect_to cart_path, :flash => { :error => "Количество товаров превышает имеющееся количество товаров у нас на складе" }
    end
  end
  private

  def medicine_params
    params.require(:purchase_medicine).permit(:amount, :medicine_id)
  end
end
