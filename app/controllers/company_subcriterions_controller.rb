class CompanySubcriterionsController < ApplicationController

	def new
		@v =""
		@company = params[:id]
		@criteria = CompanyCriterions.where(:company_id => @company)
		@subcriteria = CompanySubcriterions.where(:company_id => @company)
	end


	def create
		@company = params[:id]
		@weight= params[:company_subcriterions]
		@weight.each do|key,value|
		@record = CompanySubcriterions.where(:id => key)
		@record.update_all(:weight =>value)
		end

		redirect_to(:controller =>"companies", :action =>'show', :id => @company)
	end

	def edit
		@v =""
		@company = params[:id]
		@criteria = CompanyCriterions.where(:company_id => @company)
		@subcriteria = CompanySubcriterions.where(:company_id => @company)
	end

end
