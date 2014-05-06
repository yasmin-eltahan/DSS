class CriterionsController < ApplicationController
	def list
	@criterion = Criterion.all
	@criterionnew = Criterion.new
  	3.times { @criterionnew.subcriterions.build }
	end

	def create
		@criterion = Criterion.new(params[:criterion])
		if @criterion.save
		redirect_to(:action => 'show' , :id => @criterion.id)
		else 
			render('new')
		end	
	end


	def update 
		@criterion = Criterion.find(params[:id])
		if @criterion.update_attributes(params[:criterion])
			redirect_to(:action => 'show' , :id => params[:id])
		else 
			render('edit')
		end

	end 

	def destroy 
		Criterion.find(params[:id]).destroy
	end
end
