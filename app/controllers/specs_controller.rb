class SpecsController < ApplicationController
	
	def list
	@specs = Vendor.search(params[:search]) 
	@spec = Vendor.new
	
	end

	def create 
		@spec = Spec.new(params[:spec])
		if @spec.save
		redirect_to(:controller => 'systems' , :action => 'show' , :id => @version)
		end	
	end 

	def update 
		@spec = Spec.find(params[:id])
		if @spec.update_attributes(params[:spec])
			redirect_to(:controller => 'systems' , :action => 'show' , :id => @spec.version.system.id)
		end

	end 

	def destroy 
		Spec.find(params[:id]).destroy
	end
end
