class CompanySubcriterionsController < ApplicationController

	def new
		@v =""
		@company = params[:id]
		@criteria = CompanyCriterion.where(:company_id => @company, :system_id=>nil)
		@subcriteria = CompanySubcriterion.where(:company_id => @company)
	end


	def create
		@company = params[:id]
		@weight= params[:company_subcriterions]
		@weight.each do|key,value|
		@record = CompanySubcriterion.where(:id => key)
		@record.update_all(:weight =>value)
		end

		redirect_to(:controller =>"companies", :action =>'show', :id => @company)
	end

	def edit
		@v =""
		@company = params[:id]
		@criteria = CompanyCriterion.where(:company_id => @company ,  :system_id=>nil)
		@subcriteria = CompanySubcriterion.where(:company_id => @company)
	end

end
