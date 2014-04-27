class CompaniesController < ApplicationController

	def list
	@companies = Company.all
	@company = Company.new
	
	end

	def create
		@company = Company.new(params[:company])
		if @company.save
		redirect_to(:action => 'show' , :id => @company.id)
		else 
			render('new')
		end	
	end

	def show
		@company = Company.find(params[:id])
		@criteria = CompanyCriteria.where(:company_id => @company)
		@ids = CompanyCriteria.find(:all,:select => "criteria_id",:conditions=>{:company_id => @company}).collect(&:criteria_id)
		@subids = CompanySubcriteria.find(:all,:select => "subcriteria_id",:conditions=>{:company_id => @company}).collect(&:subcriteria_id)
	end


	def update 
		@company = Company.find(params[:id])
		if @company.update_attributes(params[:company])
			redirect_to(:action => 'show' , :id => params[:id])
		else 
			render('edit')
		end
	end 

	def destroy 
		Company.find(params[:id]).destroy
      redirect_to(:action => 'list')
	end
end
