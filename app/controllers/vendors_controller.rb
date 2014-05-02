class VendorsController < ApplicationController
	
	def list
	@vendors = Vendor.order("vendors.name ASC")
	@vendor = Vendor.new
	
	end

	def create
		@vendor = Vendor.new(params[:vendor])
		if @vendor.save
		redirect_to(:action => 'show' , :id => @vendor.id)
		else 
			render('new')
		end	
	end

	def show
		@vendor = Vendor.find(params[:id])
		@system = System.new
		@systems = System.where(:vendor_id => @vendor)
		
	end


	def update 
		@vendor = Vendor.find(params[:id])
		if @vendor.update_attributes(params[:vendor])
			redirect_to(:action => 'show' , :id => params[:id])
		else 
			render('edit')
		end

	end 

	def destroy 
		Vendor.find(params[:id]).destroy
      redirect_to(:action => 'list')
	end
end
