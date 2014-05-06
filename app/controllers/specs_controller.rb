class SpecsController < ApplicationController
	
	def list
	@specs = Spec.all
	@spec = Spec.new
	
	end

	def create 
		@spec = Spec.new(params[:spec])
		if @spec.save
		redirect_to(:controller => 'specs' , :action => 'list')
		end	
	end 

	def update 
		@spec = Spec.find(params[:id])
		if @spec.update_attributes(params[:spec])
			redirect_to(:controller => 'specs' , :action => 'list')
		end

	end 

	def destroy 
		Spec.find(params[:id]).destroy
	end
end
