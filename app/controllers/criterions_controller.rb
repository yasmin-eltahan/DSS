class CriterionsController < ApplicationController
	def list
	@criterion = Criterion.search(params[:search]) 
	@criterionnew = Criterion.new
  	2.times { @criterionnew.subcriterions.build }
	end

	def create
		@criterion = Criterion.new(params[:criterion])
		if @criterion.save
		redirect_to(:action => 'list')
		else 
			render('new')
		end	
	end


	def update 
		@criterion = Criterion.find(params[:id])
		if @criterion.update_attributes(params[:criterion])
			redirect_to(:action => 'list')
		else 
			render('edit')
		end

	end 

	def destroy 
		Criterion.find(params[:id]).destroy
		redirect_to(:action => 'list')
	end
end
